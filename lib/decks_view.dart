import 'package:flutter/material.dart';
import './model/deck.dart';
import './model/card.dart';

class DecksScreen extends StatelessWidget {

  final List<Deck> decks;

  DecksScreen(this.decks);

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
        onTap: () {
          // open page
        },
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

}