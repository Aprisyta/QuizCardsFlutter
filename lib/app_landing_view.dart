import 'package:flutter/material.dart';
import './model/deck.dart';
import 'decks_view.dart';
import 'new_deck_view.dart';

class HomeScreen extends StatelessWidget {

  final List<Deck> decks;

  HomeScreen(this.decks);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Decks"),
                Tab(text: "New Deck",)
              ],
            ),
            title: Text("Quiz Cards"),
          ),
          body: TabBarView(
              children: <Widget>[
                new DecksScreen(decks),
                new NewDeckScreen(),
              ]
          ),
        )
    );
  }

}