import 'package:flutter/material.dart';
import 'package:bandlaksehat_apps/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/bandlaklogo.png"),
                width: 350,
                height: 350,
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
            ],
          ),
        ),
      )
    );
  }
}