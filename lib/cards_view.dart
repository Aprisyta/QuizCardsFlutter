import 'package:flutter/material.dart';
import './model/deck.dart';
import './model/card.dart';
import 'cardTypes/activeQuizCard.dart';
import 'package:quiz_cards_flutter/answer.dart';

class DeckOfCardsScreen extends StatefulWidget {

  final Deck deck;

  DeckOfCardsScreen(this.deck);

  @override
  DeckOfCardsScreenState createState() => new DeckOfCardsScreenState();
}

class DeckOfCardsScreenState extends State<DeckOfCardsScreen> with TickerProviderStateMixin {

  Deck deck;

  int activeCardIndex;

//  Card currentCard;

//  Card nextCard;

  Answer userAnswer = new Answer();
  
  void initState() {
    super.initState();

    deck = new Deck(
      deckTitle: widget.deck.deckTitle,
      cards: widget.deck.cards,
    );

    activeCardIndex = widget.deck.cards.length - 1;
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
          new Container (
            alignment: Alignment.center,
            child: deck.cards.length != 0
                    ? Row (
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

//    return DraggableCard(
//      card: cards[0],
//      answer: userAnswer,
//    );

//    List<QuizCard> cardDeck = new List();


    int currentCardIndex = 0;
    return cards.map((card) {
      return DraggableCard(
        card: card,
        answer: userAnswer,
        isDraggable: currentCardIndex++ == activeCardIndex ? true : false,
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
        buttonText == "Correct" ? userAnswer.correct() : userAnswer.incorrect();
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