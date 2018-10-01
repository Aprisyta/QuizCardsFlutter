import '../model/card.dart';
import '../model/deck.dart';

class MockDecks extends Deck{

  static final List<Deck> decks = [
    Deck(
      deckTitle: "Harry Potter Quiz",
      cards: <Card>[
        Card(
          question: "Who is Ginny Weasely?",
          answer: "Weasely's youngest daughter."
        ),
        Card(
            question: "How many horcruxes are there?",
            answer: "7"
        ),
        Card(
          question: "Name of elf?",
          answer: "Dobby"
        )
      ]
    ),
    Deck(
      deckTitle: "Maths",
      cards: <Card> [
        Card(
          question: "2+5?",
          answer: "7",
        ),
        Card(
          question: "6+60",
          answer: "66"
        )
      ]
    )
  ];

  static List<Deck> fetchDecks(){
    return decks;
  }
}