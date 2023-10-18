import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peduli_yatim_pens_mobile/bloc/auth/auth_bloc.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/home_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/login_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // navigateToLoginPage();
  }

  Future<void> navigateToLoginPage() async {
    // Simulate a delay for the splash screen
    await Future.delayed(Duration(seconds: 3));

    // Navigate to the login page
    // Navigator.pushReplacementNamed(context, '/login');
    context.read<AuthBloc>().add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } else if (state is AuthAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        }
      },
      child: Scaffold(
        // backgroundColor: backgroundDarkGreenColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                child: Image.asset('asset/other/LogoHD.png'),
              ),
              // Image.asset('asset/other/logo.png'),
              SizedBox(
                height: 40,
              ),
              CircularProgressIndicator(
                color: greenPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
