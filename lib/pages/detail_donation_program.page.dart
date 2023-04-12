import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import '../widgets/percentage_bar.dart';

class DetailDonationPage extends StatelessWidget {
  const DetailDonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundGreyColor,
          appBar: AppBar(
            backgroundColor: backgroundDarkGreenColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Detail Donasi'),
          ),
        ),
      ),
    );
  }
}
