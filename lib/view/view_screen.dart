import 'package:flutter/material.dart';

import 'package:mvvm_memorize/model/model_cards.dart';
import 'package:mvvm_memorize/view/card.dart';
import 'package:mvvm_memorize/view_model/view_model.dart';
import 'package:show_up_animation/show_up_animation.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  final MemorizeViewModel viewModel = MemorizeViewModel();

// สั่ง vm start
  void _bind() {
    viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MEMORIZE GAMES"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        leading: IconButton(
            onPressed: () {
              viewModel.cardShuffle(viewModel.deck);
            },
            icon: const Icon(Icons.shuffle),
            iconSize: 30),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: viewModel.outputScoreViewModel,
            builder: (context, snapshot) {
              return _getScore(snapshot.data);
            },
          ),
          Expanded(
            child: StreamBuilder<Deck>(
              stream: viewModel.outputCardViewModel,
              builder: (context, snapshot) {
                print('new snapshot $snapshot ${snapshot.data.hashCode}');
                // 0x1
                return _getOutput(snapshot.data);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getOutput(Deck? deck) {
    return deck == null
        ? Container()
        : Column(
            children: [
              Expanded(
                  child: GridView.count(
                crossAxisCount: deck.cards.length >= 15 ? 5 : 4,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.7,
                // 0x2
                children: deck.cards
                    .map((card) => GestureDetector(
                        onTap: () {
                          viewModel.onTap(card, context);
                        },
                        child: card.hide
                            ? Container()
                            : ShowUpAnimation(
                                animationDuration:
                                    const Duration(milliseconds: 550),
                                curve: Curves.bounceIn,
                                offset: -0.2,
                                child: CardView(
                                    card.name, card.isFaceUp, deck.color))))
                    .toList(),
              )),
              Container(
                margin: const EdgeInsets.only(bottom: 20, top: 10),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 74, 171, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26)),
                      padding: const EdgeInsets.all(10)),
                  onPressed: () {
                    viewModel.newGame();
                  },
                  icon: const Icon(
                    Icons.restore_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: const Text(
                    'NewGame',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          );
  }

  Widget _getScore(int? score) {
    return score == null
        ? Container()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(viewModel.deck.emoji, style: const TextStyle(fontSize: 25)),
              Expanded(
                child: Text('  ${viewModel.deck.name}',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Text(
                  'Score : $score',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
  }
}
