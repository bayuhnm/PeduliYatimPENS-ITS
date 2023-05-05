import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundDarkGreenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              child: Image.asset('asset/other/logo.png'),
            ),
            // Image.asset('asset/other/logo.png'),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: greenPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
