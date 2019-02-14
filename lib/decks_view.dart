import 'package:flutter/material.dart';
import './model/deck.dart';
import 'deck_entry_view.dart';

class DecksScreen extends StatefulWidget {
  final List<Deck> decks;

  DecksScreen(this.decks);

  @override
  _DecksScreenState createState() => _DecksScreenState(decks);
}

class _DecksScreenState extends State<DecksScreen> {

  List<Deck> decks;

  _DecksScreenState(this.decks);

  @override
  void didUpdateWidget(DecksScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: decks.length,
        itemBuilder: _deckListBuilder
    );
  }

  Container _deckListBuilder(BuildContext context, int index) {
    Deck currentDeck = decks[index];
    String deckCardCount = currentDeck.cards.length != null ? "${currentDeck.cards.length} cards" : "0 cards";
    return new Container(
      child: ListTile(
        onTap: () => _navigateToSelectedDeckEntryScreen(context, currentDeck),
        title: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${currentDeck.deckTitle}",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            )
        ),
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
          child: Center(
              child: Text(
                "$deckCardCount",
                style: TextStyle(
                  fontSize: 20
                ),
              )
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.black)
        ),
      ),
    );
  }

  void _navigateToSelectedDeckEntryScreen(BuildContext context, Deck deck) async {
    decks = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DeckEntryScreen(deck)
        )
    );
  }

}