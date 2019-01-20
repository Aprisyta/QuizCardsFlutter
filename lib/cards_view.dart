import 'package:flutter/material.dart';
import './model/deck.dart';
import './model/card.dart';
import './cardTypes/activeQuizCard.dart';
import 'dart:async';

class DeckOfCardsScreen extends StatefulWidget {

  final Deck deck;

  DeckOfCardsScreen(this.deck);

  @override
  DeckOfCardsScreenState createState() => new DeckOfCardsScreenState();
}

class DeckOfCardsScreenState extends State<DeckOfCardsScreen> with TickerProviderStateMixin {

  Deck deck;

  AnimationController controller;
  Animation<double> swipeHorizontal;
  Animation<double> rotate;
  Animation<double> swipeVertical;
  CurvedAnimation curvedAnimation;
  
  void initState() {
    super.initState();

    deck = new Deck(
      deckTitle: widget.deck.deckTitle,
      cards: widget.deck.cards,
    );
    
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );

    curvedAnimation = CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
    );

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      new CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );

    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          setState(() {
            deck.cards.removeLast();
          });
          controller.reset();
        }
      });
    });

    swipeHorizontal = new Tween(
      begin: 0.0,
      end: 400.0,
    ).animate(curvedAnimation);

    swipeVertical = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await controller.forward();
    } on TickerCanceled {}
  }

  dismissCard() {
    setState(() {
      deck.cards.removeLast();
    });
  }

  swipeRight() {
    dismissCard();
    _swipeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    print(deck.cards.length);
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: true,
        title: new Text("${deck.deckTitle}"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Container (
            alignment: Alignment.center,
            margin: EdgeInsets.all(20.0),
            child: _renderCards(),
          ),
          new Container(
            alignment: Alignment.center,
            child: deck.cards.length != 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _renderFlatButton("Incorrect"),
                          _renderFlatButton("Correct")
                        ],
                      )
                    : null
          ),
        ],
      ),
    );
  }

  _cardDeck(List<QuizCard> cards) {
    int index = cards.length - 1;
    return deck.cards.map((card) {
      return activeQuizCard (
        card,
        context,
        swipeHorizontal.value,
        0.0,
        rotate.value,
        rotate.value < -10 ? 0.1 : 0.0,
        index--,
        dismissCard,
      );
    }).toList();
  }

  _renderCards() {
    return deck.cards.length != 0
      ? new Stack (
          alignment: Alignment.center,
          children: _cardDeck(deck.cards),
        )
      : new Container (
          child: Text (
            "You are all caught up.",
            style: TextStyle (
              fontSize: 30.0,
              color: Colors.red,
            ),
          )
        );
  }

  _renderFlatButton(String buttonText) {
    return FlatButton(
      onPressed: () {
        swipeRight();
      },
      color: buttonText == "Correct" ? Colors.green : Colors.red,
      child: Text(
        "$buttonText",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 30.0
      ),
    );
  }

}



//  AnimationController _buttonController;
//  Animation<double> rotate;
//  Animation<double> right;
//  Animation<double> bottom;
//  Animation<double> width;
//  int index = 0;
//  int flag = 0;
//
//  List selectedData = [];
//  void initState() {
//    super.initState();
//
//    cards = widget.deck.cards;
//
//    _buttonController = new AnimationController(
//        duration: new Duration(milliseconds: 1000), vsync: this);
//
//    rotate = new Tween<double>(
//      begin: -0.0,
//      end: -40.0,
//    ).animate(
//      new CurvedAnimation(
//        parent: _buttonController,
//        curve: Curves.ease,
//      ),
//    );
//    rotate.addListener(() {
//      setState(() {
//        if (rotate.isCompleted) {
//          setState(() {
//            index++;
//          });
//          _buttonController.reset();
//        }
//      });
//    });
//
//    right = new Tween<double>(
//      begin: 0.0,
//      end: 400.0,
//    ).animate(
//      new CurvedAnimation(
//        parent: _buttonController,
//        curve: Curves.ease,
//      ),
//    );
//    bottom = new Tween<double>(
//      begin: 15.0,
//      end: 100.0,
//    ).animate(
//      new CurvedAnimation(
//        parent: _buttonController,
//        curve: Curves.ease,
//      ),
//    );
//    width = new Tween<double>(
//      begin: 20.0,
//      end: 25.0,
//    ).animate(
//      new CurvedAnimation(
//        parent: _buttonController,
//        curve: Curves.bounceOut,
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    _buttonController.dispose();
//    super.dispose();
//  }
//
//  Future<Null> _swipeAnimation() async {
//    try {
//      await _buttonController.forward();
//    } on TickerCanceled {}
//  }
//
//  dismissCard(QuizCard card) {
//    setState(() {
//      index = index + 1;
//    });
//  }
//
//  swipeRight() {
//    print("Hi");
//    if (flag == 0)
//    setState(() {
//      flag = 1;
//    });
//    _swipeAnimation();
//  }
//
//  swipeLeft() {
//    if (flag == 1)
//      setState(() {
//        flag = 0;
//      });
//    _swipeAnimation();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Deck deck = widget.deck;
//    int dataLength = deck.cards.length;
//
//    timeDilation = 0.4;
//
//    double initialBottom = 15.0;
//    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
//    double backCardWidth = -10.0;
//    return (new Scaffold(
//        appBar: new AppBar(
//          automaticallyImplyLeading: true,
//          backgroundColor: Colors.black,
//          elevation: 0.0,
//          centerTitle: true,
//          title: new Text("${deck.deckTitle}"),
//        ),
//        body: new Container(
//          color: new Color.fromRGBO(106, 94, 175, 1.0),
//          alignment: Alignment.center,
//          child: dataLength > 0
//              ? new Stack(
//              alignment: AlignmentDirectional.center,
//              children: cards.map((card) {
//                if (cards.indexOf(card) == index) {
//                  print(card.question);
//                  return activeCard(
//                      card,
//                      bottom.value,
//                      right.value,
//                      0.0,
//                      backCardWidth + 10,
//                      rotate.value,
//                      rotate.value < -10 ? 0.1 : 0.0,
//                      context,
//                      dismissCard,
//                      flag,
//                      swipeRight,
//                      swipeLeft
//                  );
//                } else {
//                  backCardPosition = backCardPosition - 10;
//                  backCardWidth = backCardWidth + 10;
//
//                  return backgroundCard(
//                      card,
//                      backCardPosition,
//                      0.0,
//                      0.0,
//                      backCardWidth,
//                      0.0,
//                      0.0,
//                      context);
//                }
//              }).toList())
//              : new Text("Score",
//              style: new TextStyle(color: Colors.white, fontSize: 50.0)),
//        )));
//  }
//}