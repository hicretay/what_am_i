import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_am_i/provider/game_provider.dart';
import 'package:what_am_i/view/category_detail_page.dart';

import '../constants/color_constants.dart';
import 'widgets/category_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemCount: gameProvider.categoryData.length,
                        itemBuilder: (BuildContext context, index) {
                          return CategoryCardWidget(
                            image: gameProvider.categoryData[index].image,
                            onTap: () {
                              gameProvider.setSelectedCategory(gameProvider.categoryData[index]);
                              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                                return CategoryDetailPage(categoryData: gameProvider.categoryData[index]);
                              })));
                            },
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
