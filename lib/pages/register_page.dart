import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/bloc/auth/auth_bloc.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:peduli_yatim_pens_mobile/models/register_form_model.dart';
import 'package:peduli_yatim_pens_mobile/pages/login_page.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peduli_yatim_pens_mobile/pages/register_profile_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final confirmPasswordController = TextEditingController(text: '');

  bool validate() {
    print(nameController.text);

    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
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
            horizontal: 15,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Daftar Akun',
                    textAlign: TextAlign.start,
                    style:
                        darkTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Mari bergabunglah bersama kami dengan mendaftar akun anda sekarang juga',
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
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        // hintText: "Masukkan Email",
                        labelText: "Nama",
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
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                      ),
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
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: _validatePassword,
                      onChanged: (_) {
                        _formKey.currentState?.validate();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        labelText: "Konfirmasi Password",
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
                      ),
                      validator: _validateConfirmPassword,
                      onChanged: (_) {
                        _formKey.currentState?.validate();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthCheckEmailSuccess) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterSetProfilePage(
                                  data: RegisterFormModel(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              ),
                            );
                          }

                          if (state is AuthFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.e,
                                ),
                                backgroundColor: redColor,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                            onPressed: () {
                              if (validate()) {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthCheckEmail(emailController.text));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Semua field harus diisi',
                                    ),
                                    backgroundColor: redColor,
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Daftar',
                              style:
                                  whiteTextStyle.copyWith(fontWeight: medium),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    7), // set the desired radius
                              ),
                            ),
                          );
                        },
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
                          "Masuk",
                          style: greenTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
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
