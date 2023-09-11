import 'dart:ui';

class GameCard {
  GameCard(this.name, this.isFaceUp, this.hide);

  String name;
  bool isFaceUp;
  bool hide;
}

class Deck {
  Deck(this.emoji, this.name, this.cards, this.color);

  String emoji;
  String name;
  List<GameCard> cards;
  Color color;
}

class CardAnimation {
  CardAnimation(this.card, this.startPosition, this.endPosition);

  GameCard card;
  Offset startPosition;
  Offset endPosition;
}
