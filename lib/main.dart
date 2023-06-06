import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/pages/home_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/register_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/splash_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/login_page.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
          '/': (context) => const SplashPage(),
          '/home' : (context) => const HomePage(),
          '/login' : (context) => const LoginPage(),
          '/register' :(context) => const RegisterPage(), 

      },
    );
  }
}