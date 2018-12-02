import '../model/card.dart';
import '../model/deck.dart';

class MockDecks extends Deck{

  static final List<Deck> decks = [
    Deck(
      deckTitle: "Harry Potter Quiz",
      cards: <QuizCard>[
        QuizCard(
          question: "Who is Ginny Weasely?",
          answer: "Weasely's youngest daughter."
        ),
        QuizCard(
            question: "How many horcruxes are there?",
            answer: "7"
        ),
        QuizCard(
          question: "Name of elf?",
          answer: "Dobby"
        )
      ]
    ),
    Deck(
      deckTitle: "Maths",
      cards: <QuizCard> [
        QuizCard(
          question: "2+5?",
          answer: "7",
        ),
        QuizCard(
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
      cards: <QuizCard>[]
    );
    decks.add(newDeck);
  }

  static void addCard(String question, String answer, Deck deck) {
    QuizCard newCard = QuizCard(
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