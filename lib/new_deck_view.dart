import 'package:flutter/material.dart';
import './mocks/mock_decks.dart';
import './model/deck.dart';
import 'deck_entry_view.dart';

class NewDeckScreen extends StatefulWidget {
  @override
  _NewDeckScreenState createState() => _NewDeckScreenState();
}

class _NewDeckScreenState extends State<NewDeckScreen>{

  final textController = new TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                _infoTextNewDeckTab(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 50.0),
                  child: _textFieldNewDeckTab(),
                ),
              _submitButtonNewDeckTab()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTextNewDeckTab () {
    return Text(
      "What is the title of your deck?",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 60.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _textFieldNewDeckTab() {
    return TextField(
      controller: textController,
      textAlign: TextAlign.center,
      autocorrect: true,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black
      ),
      decoration: InputDecoration(
          hintText: "Deck Title",
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

  Widget _submitButtonNewDeckTab() {
    return RaisedButton(
      child: Text(
        "Submit",
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      color: Colors.black,
      onPressed: () {
        MockDecks.addDeck(textController.text);
        textController.text = "";
        List<Deck> decks = MockDecks.fetchDecks();
        Deck deck = decks.elementAt(decks.length - 1);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DeckEntryScreen(deck)
            )
        );
      },
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }
}