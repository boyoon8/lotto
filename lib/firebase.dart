import 'dart:io' show Platform;
import 'package:firebase_admob/firebase_admob.dart';

class FirebaseAdMobManager {
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  String appID = Platform.isIOS
      // iOS Test App ID
      ? 'ca-app-pub-3940256099942544~1458002511'
      // Android Test App ID
      : 'ca-app-pub-3940256099942544/1033173712';
  String bannerID = BannerAd.testAdUnitId;
  String interstitialID = 'ca-app-pub-3512587290196762/6866890240';

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutter', 'firebase', 'admob'],
    testDevices: <String>[],
  );

  init() async {
    FirebaseAdMob.instance.initialize(appId: appID);
    // _bannerAd = createBannerAd();
    _interstitialAd = createInterstitialAd();
    // _bannerAd
    //   ..load()
    //   ..show();
  }

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: bannerID,
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd event is $event");
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: interstitialID,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.failedToLoad) {
            _interstitialAd..load();
          } else if (event == MobileAdEvent.closed) {
            _interstitialAd = createInterstitialAd()..load();
          }
        });
  }

  showInterstitialAd() {
    _interstitialAd
      ..load()
      ..show();
  }

  void dispose() {
    _interstitialAd?.dispose();
  }
}
