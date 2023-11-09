import 'package:flutter/material.dart';
import 'dart:math';



void main() {
  return runApp(
    const MaterialApp(
      home: Scaffold(
        body: DicePage(), // Include DicePage directly
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1, right = 1;

  final double gapSize = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/casino.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            changeValue();
                          });
                        },
                        child: Transform.scale(
                          scale: 0.8,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(left / 6),
                            child: Image.asset('images/dice$left.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: gapSize),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            changeValue();
                          });
                        },
                        child: Transform.scale(
                          scale: 0.8,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(right / 6),
                            child: Image.asset('images/dice$right.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              const Text(
                'Touch to roll the dice',
                style: TextStyle(
                  fontFamily: 'Casino',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'The Total you get is: ${left + right}',
                style: const TextStyle(
                  fontFamily: 'Casino',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeValue() {
    setState(() {
      left = 1 + Random().nextInt(6);
      right = 1 + Random().nextInt(6);

      if (left == right) {
        showSameValueFeedback();
      }
    });
  }

  void showSameValueFeedback() {
    // Show a dialog notification at the top
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: const Material(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'You rolled a pair!',
                  style: TextStyle(
                    fontFamily: 'Casino',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}




