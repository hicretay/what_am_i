import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:what_am_i/view/splash_page.dart';

import 'provider/provider_list.dart';
import 'view/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  final prefs = await SharedPreferences.getInstance();
  final bool isSeen = prefs.getBool('onBoardingPage') ?? false;

  runApp(MultiProvider(
    providers: [...?ApplicationProvider.instance?.dependItems],
    child: MaterialApp(
      theme: ThemeData(
        fontFamily: 'Ubuntu-Regular',
      ),
      debugShowCheckedModeBanner: false,
      home: isSeen ? const SplashPage() : const OnBoardingPage(),
    ),
  ));
}
