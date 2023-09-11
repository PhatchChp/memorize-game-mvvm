import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView(this.item, this.isFaceUp, this.color, {super.key});

  final bool isFaceUp;
  final String item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.grey, offset: Offset(3.8, 4.1), blurRadius: 1.2)
        ],
        color: isFaceUp ? Colors.white : color,
        border: Border.all(width: 4, color: color),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.all(4),
      child: Center(
        child: Text(isFaceUp ? item : '', style: const TextStyle(fontSize: 40)),
      ),
    );
  }
}
