import 'package:flutter/material.dart';
import './model/deck.dart';
import './mocks/mock_decks.dart';
import 'deck_entry_view.dart';

class DecksScreen extends StatelessWidget {

  final List<Deck> decks = MockDecks.fetchDecks();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: decks.length,
        itemBuilder: _deckListBuilder
    );
  }

  Container _deckListBuilder(BuildContext context, int index) {
    Deck currentDeck = decks[index];
    return new Container(
      child: ListTile(
        onTap: () => _navigateToSelectedDeckEntryScreen(context, currentDeck),
        title: Center(child: Text("${currentDeck.deckTitle}")),
        subtitle: Center(child: Text("${currentDeck.cards.length} cards")),
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.black)
          )
      ),
    );
  }

  void _navigateToSelectedDeckEntryScreen(BuildContext context, Deck deck) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DeckEntryScreen(deck)
        )
    );
  }

}