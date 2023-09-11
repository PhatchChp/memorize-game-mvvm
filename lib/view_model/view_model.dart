import 'dart:async';

import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:mvvm_memorize/base/base_viewmodel.dart';
import 'package:mvvm_memorize/data/card_data.dart';
import 'package:mvvm_memorize/model/model_cards.dart';
import 'package:mvvm_memorize/view/alert_dialog.dart';
// import 'package:show_up_animation/show_up_animation.dart';

class MemorizeViewModel extends BaseViewModel
    with ViewModelInPut, ViewModelOutPut {
  final _streamController = StreamController<Deck>();
  final _streamScoreController = StreamController<int>();

  // รับ deck เข้า stream
  late Deck deck;

  int score = 0;

  List<GameCard> selectedCards = [];
  List<GameCard> collectItems = [];
  List<GameCard> wrongSelected = [];

  bool waitDelay = false;

// คะแนน
  void addScore() {
    score += 2;
  }

  void delScore() {
    score -= 1;
  }

  // สุ่มเด็คการ์ดออกมา 1 อัน
  Deck randomDeck() {
    int randomInt = Random().nextInt(listDecks.length);
    final randomDeck = listDecks[randomInt];
    return randomDeck;
  }

  void cardShuffle(Deck deck) {
    deck.cards.shuffle();

    inputCardViewModel.add(deck);
  }

//   void cardShuffleWithAnimation() {
//   deck.cards.shuffle();

//   for (var card in deck.cards) {
//     inputCardViewModel.add(
//         ShowUpAnimation(
//             animationDuration: const Duration(milliseconds: 550),
//             curve: Curves.bounceIn,
//             offset: -0.2,
//             child: deck)));
//   }
// }

// Function Ontap ของ GestureDetector
  isTap(GameCard card, BuildContext context) {
    // เช็คว่าการ์ดที่เลือกซ้ำมั้ย ค่อย add แล้วหงายการ์ด

    final checkInSelect = selectedCards.contains(card);
    if (!checkInSelect && !card.hide && !waitDelay) {
      card.isFaceUp = true;
      selectedCards.add(card);
      if (selectedCards.length == 2) {
        waitDelay = true;
      }
      cardMatch(context);
    }
  }

// NewGame
  void newGame() {
    score = 0;

    for (var i in collectItems) {
      i.isFaceUp = false;
      i.hide = false;
    }

    if (selectedCards.isNotEmpty) {
      selectedCards[0].isFaceUp = false;
    }

    selectedCards = [];
    collectItems = [];
    wrongSelected = [];

    deck = randomDeck();
    deck.cards.shuffle();

    inputCardViewModel.add(deck);
    inputScoreViewModel.add(score);
  }

// เช็คการ์ด CardMatch
  void cardMatch(BuildContext context) {
    if (selectedCards.length == 2) {
      if (selectedCards[0].name != selectedCards[1].name) {
        Future.delayed(const Duration(milliseconds: 500), () {
          print('AFTER 500MS');

          selectedCards[0].isFaceUp = false;
          selectedCards[1].isFaceUp = false;

          bool wrong1 =
              wrongSelected.any((cardWrong) => cardWrong == selectedCards[0]);
          bool wrong2 =
              wrongSelected.any((cardWrong) => cardWrong == selectedCards[1]);

          if (wrong1) {
            delScore();
          }
          if (wrong2) {
            delScore();
          }

          wrongSelected.add(selectedCards[0]);
          wrongSelected.add(selectedCards[1]);

          selectedCards = [];
          waitDelay = false;

          inputCardViewModel.add(deck);
          inputScoreViewModel.add(score);
        });
      } else {
        Future.delayed(const Duration(milliseconds: 500), () {
          collectItems.add(selectedCards[0]);
          collectItems.add(selectedCards[1]);

          selectedCards[0].hide = true;
          selectedCards[1].hide = true;

          addScore();
          selectedCards = [];

          if (collectItems.length == deck.cards.length) {
            showAlertDialog(context, score, newGame); // AleartDialog
          }
          inputCardViewModel.add(deck);
          inputScoreViewModel.add(score);
          waitDelay = false;
        });
      }
    }
    inputCardViewModel.add(deck);
    inputScoreViewModel.add(score);
  }

// Dispose
  @override
  void dispose() {
    _streamController.close();
  }

// Start
  @override
  void start() {
    _postDataToView();
  }

// Sink
  @override
  Sink<Deck> get inputCardViewModel => _streamController.sink;

// Output
  @override
  Stream<Deck> get outputCardViewModel =>
      _streamController.stream.map((deckViewModel) => deckViewModel);

// add ของเข้า Stream
  _postDataToView() {
    deck = randomDeck();

    cardShuffle(deck);

    // deck A
    inputCardViewModel.add(deck);
    inputScoreViewModel.add(score);
  }

// Function Ontap GestureDetector
  @override
  onTap(GameCard card, BuildContext context) {
    // รับของจาก stream
    isTap(card, context);
  }

// Score

  @override
  Sink<int> get inputScoreViewModel => _streamScoreController.sink;

  @override
  Stream<int> get outputScoreViewModel => _streamScoreController.stream;

  // deck [ cardZ, cardA, cardB, cardC ]
  // 0x4

  // 0x1 deck
  // 0x2 deck.cards
  // ox3 deck.cards[0] -> cardZ
  // ox4 deck.cards[1] -> cardA
  // ox5 deck.cards[2] -> cardB
  // ox6 deck.cards[3] -> cardC
}

// Input
mixin ViewModelInPut {
  onTap(GameCard card, BuildContext context);

  Sink<Deck> get inputCardViewModel;
  Sink<int> get inputScoreViewModel;
}
// Output
mixin ViewModelOutPut {
  Stream<Deck> get outputCardViewModel;
  Stream<int> get outputScoreViewModel;
}
