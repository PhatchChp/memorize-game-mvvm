import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, int score, Function newGame) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 20,
        icon: const Icon(
          Icons.task_alt,
          size: 80,
        ),
        iconColor: Colors.green,
        title: const Text(
          'AWSOME!',
          style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 74, 141, 255),
              shadows: [Shadow(color: Colors.blueGrey, offset: Offset(1, 2))]),
        ),
        content: SizedBox(
          width: 800,
          child: Text(
            'Your Score : $score',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(18, 0, 18, 7),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  newGame();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Restart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
