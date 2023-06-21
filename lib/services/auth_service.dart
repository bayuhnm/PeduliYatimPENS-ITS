import 'dart:convert';

import 'package:peduli_yatim_pens_mobile/models/login_form_model.dart';
import 'package:peduli_yatim_pens_mobile/models/register_form_model.dart';
import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://donasi.peduliyatim.or.id/api';

  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/is-email-exist',
        ),
        body: {
          'email': email,
        },
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(RegisterFormModel data) async {
    try {
      print(data.toJson());
      final res = await http.post(
        Uri.parse(
          '$baseUrl/register',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = UserModel.fromJson(jsonDecode(res.body));
        user.password = data.password;

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<UserModel> login(LoginFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.toJson(),
      );

      print(res.body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final jsonResponse = jsonDecode(res.body);

        if (jsonResponse['success'] == true) {
          final user = UserModel.fromJson(jsonResponse['data']);
          user.password = data.password;

          await storeCredentialToLocal(user);

          return user;
        } else {
          throw jsonResponse['message'];
        }
      } else {
        throw 'Failed to login';
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'access_token', value: user.accessToken);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'access_token');

    if (value != null) {
      token = value;
    }

    return token;
  }

  Future<LoginFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['access_token'] != null) {
        final LoginFormModel data = LoginFormModel(
          email: values['email'],
          password: values['password'],
        );

        print('get user from local: ${data.toJson()}');

        return data;
      } else {
        throw 'unauthenticated';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearLocalStorage() async {
    try {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }

  // Future<Map<String, dynamic>> getUserData(String accessToken) async {
  //   final response = await http.get(
  //     Uri.parse('$baseUrl/api/users/me'),
  //     headers: {
  //       'Authorization': 'Bearer $accessToken',
  //     },
  //   );

  //   final jsonData = json.decode(response.body);

  //   return jsonData;
  // }
}
