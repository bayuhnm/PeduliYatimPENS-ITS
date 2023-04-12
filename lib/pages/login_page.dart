import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/widgets/buttons.dart';
import 'package:peduli_yatim_pens_mobile/widgets/form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          children: [
            const Text('Login'),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomFormField(title: 'Email Address'),
                const SizedBox(
                  height: 20,
                ),
                const CustomFormField(title: 'Password'),
                const SizedBox(
                  height: 20,
                ),
                CustomFilledButton(
                  title: 'Login',
                  onPressed: () {},
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
