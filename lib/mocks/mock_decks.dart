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
          question: "6+60?",
          answer: "66"
        )
      ]
    ),
    Deck(
      deckTitle: "Game of Thrones",
      cards: <QuizCard> [
        QuizCard(
            question: "How many dragons Danerys had?",
            answer: "3 :("
        ),
        QuizCard(
            question: "Lion is the sigil of ______ house",
            answer: "Lanisters"
        ),
        QuizCard(
            question: "How many dragons Danerys had?",
            answer: "3 :("
        ),
        QuizCard(
            question: "Lion is the sigil of ______ house",
            answer: "Lanisters"
        ),
        QuizCard(
          question: "How many dragons Danerys had?",
          answer: "3 :("
        ),
        QuizCard(
          question: "Lion is the sigil of ______ house",
          answer: "Lanisters"
        ),
        QuizCard(
            question: "Number of Stark siblings left?",
            answer: "2"
        ),
        QuizCard(
          question: "Season 8 Episode 1 airs on?",
          answer: "April 14",
        ),
        QuizCard(
            question: "You know nothing, _____?",
            answer: "Jon Snow"
        ),
      ]
    ),
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