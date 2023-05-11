import 'package:flutter/material.dart';
import 'package:what_am_i/constants/color_constants.dart';
import 'package:what_am_i/service/google_ads.dart';
import 'package:what_am_i/view/home_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.correct, required this.wrong});

  final List<String>? correct;

  final List<String>? wrong;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  GoogleAds googleAds = GoogleAds();

  @override
  void dispose() {
    super.dispose();
    googleAds.interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    const Text(
                      'Your Score',
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    CircleAvatar(
                      minRadius: 30,
                      backgroundColor: Colors.white,
                      child: Text(
                        (widget.correct?.length).toString(),
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors().backgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 1),
                        if (widget.correct != null || widget.correct != [])
                          Expanded(
                              flex: 3,
                              child: ListView.builder(
                                  itemCount: widget.correct?.length,
                                  shrinkWrap: true,
                                  itemBuilder: ((context, index) {
                                    return Row(
                                      children: [
                                        const Icon(Icons.check, color: Colors.green),
                                        Expanded(
                                          child: Text(
                                            widget.correct?[index] ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    );
                                  }))),
                        if (widget.wrong != null || widget.wrong != [])
                          Expanded(
                              flex: 3,
                              child: ListView.builder(
                                  itemCount: widget.wrong?.length,
                                  shrinkWrap: true,
                                  itemBuilder: ((context, index) {
                                    return Row(
                                      children: [
                                        const Icon(Icons.close, color: Colors.red),
                                        Expanded(
                                          child: Text(
                                            widget.wrong?[index] ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    );
                                  }))),
                        const Spacer(flex: 1),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Material(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(MediaQuery.of(context).size.width / 1.5, 60),
                          backgroundColor: const Color(0xFF32091f),
                          side: const BorderSide(width: 2.0, color: Colors.white),
                        ),
                        onPressed: () {
                          googleAds.loadInterstitalAd();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: ((context) {
                              return const HomePage();
                            })),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'Go Categories',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
