import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Admob',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd bAd = new BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-1277658302369683/6043045696',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('Ad Loaded');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Ad failed to Load');
          ad.dispose();
        },
        onAdOpened: (Ad ad) {
          print('Ad Opened');
        },
      ),
      request: AdRequest());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: AdWidget(
          ad: bAd..load(),
          key: UniqueKey(),
        ),
        height: 50,
      ),
    );
  }
}
