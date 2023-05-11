import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_am_i/model/data_model.dart';
import 'package:what_am_i/view/start_game_page.dart';

import '../constants/color_constants.dart';
import '../provider/game_provider.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({super.key, required this.categoryData});

  final DataModel categoryData;

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  int minute = 01;
  String second = '00';
  @override
  Widget build(BuildContext context) {
    GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        color: AppColors().backgroundColor,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/home.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Back',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: (MediaQuery.of(context).size.width - 32) / 2,
                    height: (MediaQuery.of(context).size.height - 32) / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage(widget.categoryData.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.categoryData.description,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF32091f),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.white, width: 2.0),
                    ),
                    width: (MediaQuery.of(context).size.width / 1.5),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: const Icon(Icons.remove, color: Colors.white),
                          onTap: () {
                            if (second == '00' && minute != 00) {
                              setState(() {
                                second = '30';
                                minute--;
                              });
                            } else if (minute != 0 && second != '00') {
                              setState(() {
                                second = '00';
                              });
                            }
                          },
                        ),
                        Text(
                          '0$minute:$second',
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        InkWell(
                          child: const Icon(Icons.add, color: Colors.white),
                          onTap: () {
                            if (second == '00') {
                              setState(() {
                                second = '30';
                              });
                            } else if (minute < 3) {
                              setState(() {
                                minute++;
                                second = '00';
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Material(
                    borderRadius: BorderRadius.circular(8.0),
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width / 1.5, 60),
                        backgroundColor: const Color(0xFF32091f),
                        side: const BorderSide(width: 2.0, color: Colors.white),
                      ),
                      onPressed: () {
                        gameProvider.setMinute(minute);
                        gameProvider.setSecond(second);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: ((context) {
                            return const StartGamePage();
                          })),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        'Start',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
