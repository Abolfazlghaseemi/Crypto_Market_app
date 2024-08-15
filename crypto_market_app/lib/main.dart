import 'package:crypto_market_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  var application = Application();
  runApp(application);
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
