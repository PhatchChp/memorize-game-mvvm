import 'package:flutter/material.dart';

import '../model/model_cards.dart';

class ColorCards {
  static Color red = Colors.redAccent;
  static Color blue = Colors.blue;
  static Color green = const Color.fromARGB(255, 153, 218, 80);
  static Color yellow = Colors.amber;
}

List<Deck> listDecks = [
  // Deck('🐱', 'Animals', animals, ColorCards.yellow),
  // Deck('🚗', 'Vehicles', vehicles, ColorCards.red),
  Deck('🍏', 'Fruits', fruits, ColorCards.green),
  Deck('🌧️', 'Weather', weather, ColorCards.blue)
];

List<GameCard> animals = [
  GameCard('🐘', false, false),
  GameCard('🐊', false, false),
  GameCard('🦓', false, false),
  GameCard('🐌', false, false),
  GameCard('🦄', false, false),
  GameCard('🐬', false, false),
  GameCard('🐱', false, false),
  GameCard('🐼', false, false),
  GameCard('🐻‍❄️', false, false),
  GameCard('🐘', false, false),
  GameCard('🐊', false, false),
  GameCard('🦓', false, false),
  GameCard('🐌', false, false),
  GameCard('🦄', false, false),
  GameCard('🐬', false, false),
  GameCard('🐱', false, false),
  GameCard('🐼', false, false),
  GameCard('🐻‍❄️', false, false),
];

List<GameCard> vehicles = [
  GameCard('🚗', false, false),
  GameCard('🚕', false, false),
  GameCard('🚙', false, false),
  GameCard('🚌', false, false),
  GameCard('🚎', false, false),
  GameCard('🏎️', false, false),
  GameCard('🚛', false, false),
  GameCard('🚑', false, false),
  GameCard('🛺', false, false),
  GameCard('🚜', false, false),
  GameCard('🚓', false, false),
  GameCard('🛵', false, false),
  GameCard('🚗', false, false),
  GameCard('🚕', false, false),
  GameCard('🚙', false, false),
  GameCard('🚌', false, false),
  GameCard('🚎', false, false),
  GameCard('🏎️', false, false),
  GameCard('🚛', false, false),
  GameCard('🚑', false, false),
  GameCard('🛺', false, false),
  GameCard('🚜', false, false),
  GameCard('🚓', false, false),
  GameCard('🛵', false, false),
];

List<GameCard> fruits = [
  GameCard('🍏', false, false),
  GameCard('🍌', false, false),
  GameCard('🍇', false, false),
  GameCard('🍓', false, false),
  GameCard('🍒', false, false),
  GameCard('🥝', false, false),
  GameCard('🍍', false, false),
  GameCard('🍑', false, false),
  GameCard('🍊', false, false),
  GameCard('🍎', false, false),
  GameCard('🍈', false, false),
  GameCard('🥥', false, false),
  GameCard('🍏', false, false),
  GameCard('🍌', false, false),
  GameCard('🍇', false, false),
  GameCard('🍓', false, false),
  GameCard('🍒', false, false),
  GameCard('🥝', false, false),
  GameCard('🍍', false, false),
  GameCard('🍑', false, false),
  GameCard('🍊', false, false),
  GameCard('🍎', false, false),
  GameCard('🍈', false, false),
  GameCard('🥥', false, false),
];

List<GameCard> weather = [
  GameCard('🌤️', false, false),
  // Cards('⛅️', false, false),
  // Cards('🌧️', false, false),
  // Cards('☀️', false, false),
  // Cards('❄️', false, false),
  // Cards('🌩️', false, false),
  GameCard('🌤️', false, false),
  // Cards('⛅️', false, false),
  // Cards('🌧️', false, false),
  // Cards('☀️', false, false),
  // Cards('❄️', false, false),
  // Cards('🌩️', false, false),
];
