import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:what_am_i/view/game_page.dart';

import '../constants/color_constants.dart';
import '../provider/game_provider.dart';

class StartGamePage extends StatefulWidget {
  const StartGamePage({super.key});

  @override
  State<StartGamePage> createState() => _StartGamePageState();
}

class _StartGamePageState extends State<StartGamePage> {
  Widget centerWidget = const Text(
    'Place on foreahead',
    style: TextStyle(color: Colors.white, fontSize: 50),
  );

  @override
  void initState() {
    super.initState();
    GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);

    Future.delayed(const Duration(seconds: 2), () async {
      centerWidget = SlideCountdown(
        textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.transparent,
        ),
        duration: const Duration(seconds: 4),
        onDone: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) {
              return GamePage(seconds: int.parse(gameProvider.second!), minutes: gameProvider.minute!);
            })),
            (route) => false,
          );
        },
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Center(child: centerWidget),
            ),
          ),
        ),
      ),
    );
  }
}
