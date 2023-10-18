import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peduli_yatim_pens_mobile/bloc/auth/auth_bloc.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/pages/main_page.dart';
import 'package:peduli_yatim_pens_mobile/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: redColor,
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: authBloc,
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return LoginForm(authBloc: authBloc);
          },
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final AuthBloc authBloc;

  const LoginForm({required this.authBloc, super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        // hintText: "Masukkan Email",
                        labelText: "Email",
                        labelStyle: TextStyle(
                          // color: Colors.black45,
                          fontFamily: 'Open Sans',
                          fontSize: 14,
                          fontWeight: regular,
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
                        // errorBorder: OutlineInputBorder(
                        //   borderSide:
                        //       BorderSide(color: redColor, width: 1.2),
                        //   borderRadius: BorderRadius.circular(7),
                        // ),
                        // errorStyle: TextStyle(color: redColor),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
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
                      controller: passwordController,
                      obscureText: passwordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        labelText: "Password",
                        labelStyle: TextStyle(
                          // color: Colors.black45,
                          fontFamily: 'Open Sans',
                          fontSize: 14,
                          fontWeight: regular,
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
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     GestureDetector(
                  //         onTap: () {
                  //           print("Clicked");
                  //         },
                  //         child: Text(
                  //           "Lupa Password?",
                  //           style: greenTextStyle.copyWith(
                  //               fontSize: 14, fontWeight: medium),
                  //         ))
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        // onPressed: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => MainPage(),
                        //     ),
                        //   );
                        // },
                        onPressed: () {
                          final String email = emailController.text;
                          final String password = passwordController.text;
                          widget.authBloc
                              .add(LoggedIn(email: email, password: password));
                          print('Login button pressed');
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
