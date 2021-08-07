import 'package:digishop/utils/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AdMobService.initialze();


    AdMobService.createInterstial();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: AdWidget(
            key : UniqueKey(),
            ad: AdMobService.createBannerunitId()..load(),
          ),
        ),
      ),
    );
  }
}
