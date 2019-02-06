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

  Answer userAnswer;
  
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
    print(activeCardIndex);
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: true,
        title: new Text("${deck.deckTitle}"),
        centerTitle: true,
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: activeCardIndex == -1 ? <Widget>[Text('Yo')] :

        <Widget>[
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

  //   1 0
  //
  _cardDeck(List<QuizCard> cards) {
    print("deck");
    int currentCardIndex = 0;
    List<DraggableCard> newCardDeck = new List();
    for (QuizCard card in cards) {
      if (currentCardIndex <= activeCardIndex) {
        userAnswer = new Answer();
        DraggableCard x = new DraggableCard(
          card: card,
          answer: userAnswer,
          isDraggable: currentCardIndex++ == activeCardIndex ? true : false,
          onSlideOutComplete: _onSlideOutComplete,
        );
        newCardDeck.add(x);
      }
    }
    return newCardDeck.toList();
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
    return FlatButton (
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

  _onSlideOutComplete() {
    print("called");
    setState(() {
      activeCardIndex = activeCardIndex - 1;
    });
  }
}