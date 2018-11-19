import 'package:flutter/material.dart';
import './model/deck.dart';
import './model/card.dart';
import './cardTypes/activeCard.dart';
import './cardTypes/backgroundCard.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:async';

class DeckOfCardsScreen extends StatefulWidget {

  final Deck deck;

  DeckOfCardsScreen(this.deck);

  @override
  DeckOfCardsScreenState createState() => new DeckOfCardsScreenState();
}

class DeckOfCardsScreenState extends State<DeckOfCardsScreen> with TickerProviderStateMixin {

  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int index = 0;
  int flag = 0;
  List<QuizCard> cards;

  List selectedData = [];
  void initState() {
    super.initState();

    cards = widget.deck.cards;

    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          setState(() {
            index++;
          });
          _buttonController.reset();
        }
      });
    });

    right = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    width = new Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  dismissCard(QuizCard card) {
    setState(() {
      index = index + 1;
    });
  }

  addImg(QuizCard card) {
    setState(() {

    });
  }


  swipeRight() {
    print("Hi");
    if (flag == 0)
    setState(() {
      flag = 1;
    });
    _swipeAnimation();
  }

  swipeLeft() {
    if (flag == 1)
      setState(() {
        flag = 0;
      });
    _swipeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    Deck deck = widget.deck;
    int dataLength = deck.cards.length;

    timeDilation = 0.4;

    double initialBottom = 15.0;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;
    return (new Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          elevation: 0.0,
          centerTitle: true,
          title: new Text("${deck.deckTitle}"),
        ),
        body: new Container(
          color: new Color.fromRGBO(106, 94, 175, 1.0),
          alignment: Alignment.center,
          child: dataLength > 0
              ? new Stack(
              alignment: AlignmentDirectional.center,
              children: cards.map((card) {
                if (cards.indexOf(card) == index) {
                  print(card.question);
                  return activeCard(
                      card,
                      bottom.value,
                      right.value,
                      0.0,
                      backCardWidth + 10,
                      rotate.value,
                      rotate.value < -10 ? 0.1 : 0.0,
                      context,
                      dismissCard,
                      flag,
                      swipeRight,
                      swipeLeft
                  );
                } else {
                  backCardPosition = backCardPosition - 10;
                  backCardWidth = backCardWidth + 10;

                  return backgroundCard(
                      card,
                      backCardPosition,
                      0.0,
                      0.0,
                      backCardWidth,
                      0.0,
                      0.0,
                      context);
                }
              }).toList())
              : new Text("Score",
              style: new TextStyle(color: Colors.white, fontSize: 50.0)),
        )));
  }
}