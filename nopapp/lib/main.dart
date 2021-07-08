import 'package:nopapp/src/ui/homePage.dart';
import 'package:nopapp/src/splash/splash_screens.dart';
import 'package:nopapp/src/Constant/Constant.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nop App',
      theme: ThemeData(
        primaryColor: Color(0xFFFFA7A6),
      ),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
        HOME_SCREEN: (BuildContext context) => HomePage(),
      },
      home: AnimatedSplashScreen(),
    );
  }
}
