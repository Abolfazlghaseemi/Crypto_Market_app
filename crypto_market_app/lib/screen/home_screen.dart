import 'package:crypto_market_app/data/constants/constants.dart';
import 'package:crypto_market_app/data/model/crypto.dart';
import 'package:crypto_market_app/screen/coin_list_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Crypto? crypto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitWave(
              color: greenColor,
              size: 30.0,
            )
          ],
        ),
      ),
    );
  }

  void getData() async {
    var response = await Dio().get('https://api.coincap.io/v2/assets');
    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CoinListScreen(
                  cryptoResultList: cryptoList,
                )));
  }
}
