import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:what_am_i/constants/color_constants.dart';
import 'package:what_am_i/view/splash_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void saveFirstSeen() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('onBoardingPage', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: SafeArea(
          child: PageView(
            controller: controller,
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'How can play?',
                      style: TextStyle(
                        fontSize: 28,
                        color: AppColors().backgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '1. Choose a category',
                          style: TextStyle(fontSize: 20, color: AppColors().backgroundColor),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 180,
                          height: 350,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage("assets/gifs/cat.gif"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '2. Choose game time',
                          style: TextStyle(fontSize: 20, color: AppColors().backgroundColor),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 180,
                          height: 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage("assets/gifs/time.gif"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Tilt down for correct answer',
                          style: TextStyle(fontSize: 20, color: AppColors().backgroundColor),
                        ),
                        Container(
                          width: 300,
                          height: 280,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Tilt up for wrong answer',
                          style: TextStyle(fontSize: 20, color: AppColors().backgroundColor),
                        ),
                        Container(
                          width: 300,
                          height: 280,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/2.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  saveFirstSeen();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                    return const SplashPage();
                  }), (route) => false);
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(
                    color: AppColors().backgroundColor,
                    fontSize: 18,
                  ),
                )),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.grey,
                  activeDotColor: AppColors().backgroundColor,
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (controller.page == 0) {
                    controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                  } else {
                    saveFirstSeen();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                      return const SplashPage();
                    }), (route) => false);
                  }
                },
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    color: AppColors().backgroundColor,
                    fontSize: 18,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
