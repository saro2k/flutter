import 'package:flutter/material.dart';
import 'package:RedMusic_app/constants.dart';
import 'constants.dart';
import 'Splash.dart';
void main(){
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
