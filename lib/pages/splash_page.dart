import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
