import 'package:flutter/material.dart';
import './model/deck.dart';
import './model/card.dart';
import './mocks/mock_decks.dart';

void main() => runApp(new MyApp());

final List<Deck> decks = MockDecks.fetchDecks();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: DefaultTabController(
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
                  new ListView.builder(
                      itemCount: decks.length,
                      itemBuilder: (BuildContext context,int index){
                        return new Container(
                          child: ListTile(
                            title: Center(child: Text("${decks[index].deckTitle}")),
                            subtitle: Center(child: Text("${decks[index].cards.length} cards")),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black)
                              )
                          ),
                        );
                      }
                    ),
                  new Text("Hi")
                ]
            ),
          )
      ),
    );
  }
}

