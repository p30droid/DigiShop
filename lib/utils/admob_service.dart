import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String get bannerId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/6300978111';

  static initialze() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerunitId() {
    BannerAd ad = new BannerAd(
        size: AdSize.banner,
        adUnitId: bannerId,
        listener: BannerAdListener(
            onAdClosed: (Ad ad) => print('Ad Closed'),
            onAdLoaded: (Ad ad) => print('Ad Loaded'),
            onAdFailedToLoad: (Ad ad, LoadAdError) {
              print('Ad LoadAdError');
            }),
        request: AdRequest());

    return ad;
  }

   static createInterstial() {


    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
         //   this._interstitialAd = ad;


            print('InterstitialAd loaded');

            ad.show();

          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));

    }


}
