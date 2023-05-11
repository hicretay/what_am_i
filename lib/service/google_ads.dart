// ignore_for_file: avoid_print
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds {
  InterstitialAd? interstitialAd;

  final adUnitId = 'ca-app-pub-3835201968151360/3848813658';

  /// Loads an interstitial ad.
  void loadInterstitalAd() {
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            print('$ad loaded.');
            interstitialAd = ad;
            showInterstitalAd();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  void showInterstitalAd() {
    if (interstitialAd != null) {
      interstitialAd?.show();
    }
  }
}
