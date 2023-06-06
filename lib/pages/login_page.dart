import 'dart:math';

import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/pages/home_page.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/main_page.dart';
import 'package:peduli_yatim_pens_mobile/widgets/buttons.dart';
import 'package:peduli_yatim_pens_mobile/widgets/form.dart';
import 'package:peduli_yatim_pens_mobile/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: myColor,
        primarySwatch: myColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15
          ),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    child: Image.asset('asset/other/LogoHD.png'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Masuk Akun',
                    style: darkTextStyle.copyWith(
                        fontSize: 24, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Sisihkanlah rezeki anda untuk meraih keberkahan yang melimpah dari Allah SWT.',
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        // hintText: "Masukkan Email",
                        labelText: "Email",
                        labelStyle: TextStyle(
                          // color: Colors.black45,
                          fontFamily: 'opensans',
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 1.2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: greenPrimaryColor, width: 1.2),
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@') ||
                            !value.contains('.')) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      obscureText: passwordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        labelText: "Password",
                        labelStyle: TextStyle(
                          // color: Colors.black45,
                          fontFamily: 'opensans',
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 1.2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: greenPrimaryColor, width: 1.2),
                            borderRadius: BorderRadius.circular(7)),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            print("Clicked");
                          },
                          child: Text(
                            "Lupa Password?",
                            style: greenTextStyle.copyWith(
                                fontSize: 14, fontWeight: medium),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Masuk',
                          style: whiteTextStyle.copyWith(fontWeight: medium),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                7), // set the desired radius
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun?  ",
                        style: darkTextStyle,
                      ),
                      GestureDetector(
                        child: Text(
                          "Daftar",
                          style: greenTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
