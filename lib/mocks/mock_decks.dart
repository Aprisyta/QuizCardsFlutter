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

  static void addDeck(String deckTitle) {
    Deck newDeck = Deck(
      deckTitle: deckTitle,
      cards: <Card>[]
    );
    decks.add(newDeck);
  }

  static void addCard(String question, String answer, Deck deck) {
    Card newCard = Card(
      question: question,
      answer: answer
    );
    decks.forEach((currentDeck) {
      if(currentDeck.hashCode == deck.hashCode) {
        currentDeck.cards.add(newCard);
      }
    });
  }
}