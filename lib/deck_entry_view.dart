import 'package:flutter/material.dart';
import './model/deck.dart';
import 'new_add_card_view.dart';

class DeckEntryScreen extends StatelessWidget {

  final Deck deck;

  DeckEntryScreen(this.deck);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("${deck.deckTitle}"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 100.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "${deck.deckTitle}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 60.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 100.0),
                child: Text(
                  "${deck.cards.length} cards",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  child: Text(
                    "Add Card",
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewCardScreen(deck)),
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    )
                  ),
                ),
              ),
              RaisedButton(
                child: Text(
                  "Start Quiz",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
                color: Colors.black,
                onPressed: () {
                  // add card to deck
                },
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}