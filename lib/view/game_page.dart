// ignore_for_file: avoid_print, unused_field

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:what_am_i/constants/color_constants.dart';
import 'package:what_am_i/view/result_page.dart';

import '../provider/game_provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.seconds, required this.minutes});

  final int seconds;
  final int minutes;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //Stream<GyroscopeEvent>? gyroscopeEvent;

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  List<double>? _gyroscopeValues;

  double x = 0, y = 0, z = 0;
  String direction = "none";

  List<String>? correct = [];
  List<String>? wrong = [];

  bool enabled = true;
  bool correctAnswer = false;
  bool wrongAnswer = false;

  AudioPlayer audioPlayer = AudioPlayer();

  void playAudio(String soundName) async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/$soundName.mp3'));
  }

  @override
  void initState() {
    Provider.of<GameProvider>(context, listen: false).selectedCategory?.words.shuffle();

    _streamSubscriptions.add(
      gyroscopeEvents.listen(
        (GyroscopeEvent event) {
          setState(() {
            _gyroscopeValues = <double>[event.x, event.y, event.z];

            if (event.y < -2 && enabled == true) {
              print('kelime doğru y eksi ${event.y}');
              playAudio('correct');

              correct?.add(Provider.of<GameProvider>(context, listen: false).selectedCategory?.words[listIndex] ?? 'An error occured');
              listIndex++;
              setState(() {
                enabled = false;
                correctAnswer = true;
              });

              correct?.forEach((element) {
                print(element);
              });

              Future.delayed(const Duration(seconds: 2), () async {
                setState(() {
                  enabled = true;
                  correctAnswer = false;
                });
              });
            } else if (event.y > 2 && enabled == true) {
              print('kelime yanlış y artı ${event.y}');
              playAudio('wrong');
              wrong?.add(Provider.of<GameProvider>(context, listen: false).selectedCategory?.words[listIndex] ?? 'An error occured');

              listIndex++;

              setState(() {
                enabled = false;
                wrongAnswer = true;
              });

              wrong?.forEach((element) {
                print(element);
              });

              Future.delayed(const Duration(seconds: 2), () async {
                setState(() {
                  enabled = true;
                  wrongAnswer = false;
                });
              });
            }
          });
        },
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  int listIndex = 0;

  @override
  Widget build(BuildContext context) {
    GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);

    // final gyroscope = _gyroscopeValues?.map((double v) => v.toStringAsFixed(1)).toList();

    return Scaffold(
      body: Container(
        color: AppColors().backgroundColor,
        child: RotatedBox(
          quarterTurns: 1,
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  correctAnswer
                      ? Image.asset(
                          'assets/gifs/correct.gif',
                          width: 80,
                          height: 80,
                        )
                      : wrongAnswer
                          ? Image.asset(
                              'assets/gifs/wrong.gif',
                              width: 80,
                              height: 80,
                            )
                          : Row(
                              children: [
                                const Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF32091f),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(color: Colors.white, width: 2.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Text(
                                        gameProvider.selectedCategory?.words[listIndex] ?? 'No data',
                                        style: const TextStyle(color: Colors.white, fontSize: 90),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                  // Text('Gyroscope: $gyroscope', style: const TextStyle(color: Colors.white, fontSize: 10)),
                  const Spacer(),
                  SlideCountdown(
                    textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.transparent,
                    ),
                    duration: Duration(minutes: widget.minutes, seconds: widget.seconds),
                    onDone: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            wrong: wrong,
                            correct: correct,
                          ),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
