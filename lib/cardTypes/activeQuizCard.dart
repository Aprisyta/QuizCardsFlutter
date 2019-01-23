import 'dart:math';
import '../model/card.dart';
import 'package:flutter/material.dart';

class DraggableCard extends StatefulWidget {

  final QuizCard card;

  const DraggableCard({Key key, this.card}) : super(key: key);

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> with TickerProviderStateMixin {

  Offset cardOffset = const Offset(0.0, 0.0);
  Offset dragStart;
  Offset dragPosition;
  Offset slideCardBack;
  AnimationController slideCardBackController;
  Tween<Offset> slideOutTween;
  AnimationController slideOutController;


  @override
  void initState() {
    super.initState();

    slideCardBackController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )
    ..addListener(() => setState(() {
      cardOffset = Offset.lerp(slideCardBack, const Offset(0.0, 0.0), Curves.elasticInOut.transform(slideCardBackController.value));
    }))
    ..addStatusListener((AnimationStatus status) {
      if ( status == AnimationStatus.completed ) {
        setState(() {
          dragStart = null;
          dragPosition = null;
          slideCardBack = null;
        });
      }
    });

    slideOutController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )
    ..addListener(() => setState(() {
      cardOffset = slideOutTween.evaluate(slideOutController);
    }))
    ..addStatusListener((AnimationStatus status) {
      if ( status == AnimationStatus.completed ) {
        setState(() {
          dragStart = null;
          dragPosition = null;
          slideOutTween = null;
          cardOffset = const Offset(0.0, 0.0);
        });
      }
    });
  }

  @override
  void dispose() {
    slideCardBackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return draggableCard(widget.card);
  }

  Widget draggableCard (QuizCard card) {
    Size screenSize = MediaQuery.of(context).size;
    return new Positioned(
      child: Transform(
          transform: Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0)
              ..rotateZ(_rotation(screenSize)),
          origin: _rotationOrigin(screenSize),
          child: GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            onTap: () {
              //  flip card
            },
            child: new Card(
              color: Colors.red,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black,
                  )
              ),
              child: new Container(
                height: screenSize.height/2.0,
                alignment: Alignment.center,
                child: Text(
                  "${card.question}",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
          ),
        ),
    );
  }

  void _onPanStart(DragStartDetails details) {
    dragStart = details.globalPosition;

    if (slideCardBackController.isAnimating) {
      setState(() {
        slideCardBackController.stop(canceled: true);
      });
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = details.globalPosition;
      cardOffset = dragPosition - dragStart;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final dragVector = cardOffset / cardOffset.distance;
    final isInCorrect = (cardOffset.dx / context.size.width) < -0.45;
    final isCorrect = (cardOffset.dx / context.size.width) > 0.45;

    setState(() {
      if (isInCorrect || isCorrect) {
        slideOutTween = new Tween(
          begin: cardOffset,
          end: dragVector * (2 * context.size.width),
        );
        slideOutController.forward(from: 0.0);
      }
      else {
        slideCardBack = cardOffset;
        slideCardBackController.forward(from: 0.0);
      }
    });
  }

  double _rotation(dragBounds) {
    if (dragStart != null) {
      double screenWidth = MediaQuery
          .of(context)
          .size
          .width;
      double screenHeight = MediaQuery
          .of(context)
          .size
          .height;
      int rotationCornerMultiplier = dragStart.dy >= screenHeight/2 ? -1 : 1;
      return (pi / 8) * (cardOffset.dx / screenWidth ) * rotationCornerMultiplier;
    }
    else
      return 0.0;
  }

  Offset _rotationOrigin(dragBounds) => dragStart != null ? dragStart : const Offset(0.0, 0.0);
}