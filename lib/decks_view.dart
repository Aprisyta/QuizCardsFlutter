import 'package:flutter/material.dart';
import './model/deck.dart';
import 'deck_entry_view.dart';
import './mocks/mock_decks.dart';

class DecksScreen extends StatefulWidget {
  final List<Deck> decks;

  DecksScreen(this.decks);

  @override
  _DecksScreenState createState() => _DecksScreenState(decks);


}

class _DecksScreenState extends State<DecksScreen> {

//  final List<Deck> decks = MockDecks.fetchDecks();

  List<Deck> decks;

  _DecksScreenState(this.decks);

  @override
  Widget build(BuildContext context) {
    MockDecks.decks.forEach((deck) {
      print(deck.deckTitle);
      deck.cards.forEach((card) {
        print(card.question);
        print(card.answer);
        print("__-___-___-___-___-");
      });
      print("___________________");
    });
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