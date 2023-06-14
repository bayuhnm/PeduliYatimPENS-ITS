import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peduli_yatim_pens_mobile/bloc/auth/auth_bloc.dart';
import 'package:peduli_yatim_pens_mobile/bloc/user/user_bloc.dart';
import 'package:peduli_yatim_pens_mobile/pages/detail_donation_program.page.dart';
import 'package:peduli_yatim_pens_mobile/pages/donation_amount_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/donation_list_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/home_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/payment_success.dart';
import 'package:peduli_yatim_pens_mobile/pages/profile_page.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        // BlocProvider(
        //   create: (context) => UserBloc(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => RegisterPage(),
          '/donation-detail': (context) => DetailDonationPage(),
          '/profile': (context) => ProfilePage(),
          '/success': (context) => const PaymentSuccessPage(),
          '/donation-list': (context) => DonationListPage(),
          '/donation-amount': (context) => DonationAmountPage(),
        },
      ),
    );
  }
}
