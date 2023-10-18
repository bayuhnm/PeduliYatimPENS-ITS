import 'dart:convert';
import 'dart:math';

import 'package:peduli_yatim_pens_mobile/models/login_form_model.dart';
import 'package:peduli_yatim_pens_mobile/models/register_form_model.dart';
import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final String baseUrl = 'https://donasi.peduliyatim.or.id';

  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData['success'] == true) {
        final String accessToken = responseData['data']['access_token'];
        await secureStorage.write(key: 'access_token', value: accessToken);
        print('Access Token: $accessToken');
        return accessToken;
      }
    }

    throw Exception('Login failed');
  }

  Future<bool> hasToken() async {
    final String? token = await secureStorage.read(key: 'access_token');
    return token != null;
  }

  Future<bool> isValidToken() async {
    final String? token = await secureStorage.read(key: 'access_token');

    if (token != null) {
      final response = await http.get(
        Uri.parse('$baseUrl/api/users/me'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return true;
      }
    }

    return false;
  }

  Future<void> logout() async {
    await secureStorage.delete(key: 'access_token');
  }
}