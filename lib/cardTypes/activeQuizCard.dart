import 'dart:math';
import '../model/card.dart';
import 'package:flutter/material.dart';

class DraggableCard extends StatefulWidget {

  final QuizCard card;

  const DraggableCard({Key key, this.card}) : super(key: key);

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> {

  Offset cardOffset = const Offset(0.0, 0.0);
  Offset dragStart;
  Offset dragPosition;

  @override
  Widget build(BuildContext context) {
    return draggableCard(widget.card);
  }

  Widget draggableCard (QuizCard card) {
    Size screenSize = MediaQuery.of(context).size;
    return new Positioned(
      child: Transform(
          transform: Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0),
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
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = details.globalPosition;
      cardOffset = dragPosition - dragStart;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      dragStart = null;
      dragPosition = null;
      cardOffset = const Offset(0.0, 0.0);
    });
  }
}