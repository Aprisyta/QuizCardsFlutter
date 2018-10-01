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
                            onTap: () {
                              // open page
                            },
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new Column(
                      children: <Widget>[
                        Text(
                          "What is the title of your deck?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 60.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 50.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            autocorrect: true,
                            style: TextStyle(
                              fontSize: 20.0
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
                          ),
                        ),
                        RaisedButton(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          color: Colors.black,
                          onPressed: () {
                            // add deck to decks
                          },
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                        )
                      ],
                    ),
                  )
                ]
            ),
          )
      ),
    );
  }
}

