import 'package:flutter/material.dart';
import './mocks/mock_decks.dart';
import './model/deck.dart';

class NewCardScreen extends StatefulWidget {

  final Deck deck;

  NewCardScreen(this.deck);

  @override
  _NewAddCardScreenState createState() => _NewAddCardScreenState();
}

class _NewAddCardScreenState extends State<NewCardScreen> {

  final questionTextController = new TextEditingController();
  final answerTextController = new TextEditingController();

  @override
  void dispose() {
    questionTextController.dispose();
    answerTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Deck deck = widget.deck;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Add Card"),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 25.0),
                    child: _questionFieldNewCardScreen(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 50.0),
                    child: _answerFieldNewCardScreen(),
                  ),
                  _submitButton(deck)
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget _questionFieldNewCardScreen() {
    return TextField(
      controller: questionTextController,
      textAlign: TextAlign.center,
      autocorrect: true,
      style: TextStyle(
          fontSize: 20.0,
          color: Colors.black
      ),
      decoration: InputDecoration(
          hintText: "Question",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                  style: BorderStyle.solid
              )
          )
      ),
    );
  }

  Widget _answerFieldNewCardScreen() {
    return TextField(
      controller: answerTextController,
      textAlign: TextAlign.center,
      autocorrect: true,
      style: TextStyle(
          fontSize: 20.0,
          color: Colors.black
      ),
      decoration: InputDecoration(
          hintText: "Answer",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                  style: BorderStyle.solid
              )
          )
      ),
    );
  }

  Widget _submitButton(Deck deck) {
    return RaisedButton(
      child: Text(
        "Submit",
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      color: Colors.black,
      onPressed: () {
        MockDecks.addCard(questionTextController.text, answerTextController.text, deck);
        questionTextController.text = "";
        answerTextController.text = "";
        Navigator.pop(context);
//        MockDecks.decks.forEach((deck) {
//          print(deck.deckTitle);
//          deck.cards.forEach((card) {
//            print(card.question);
//            print(card.answer);
//          });
//          print("___________________");
//        });
      },
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }
}
