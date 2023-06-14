import 'dart:convert';

import 'package:peduli_yatim_pens_mobile/models/user_model.dart';
import 'package:peduli_yatim_pens_mobile/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'https://donasi.peduliyatim.or.id/api';

  Future<List<UserModel>> getUsersById(int id) async {
    try {
      // final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/users/$id'),
        // headers: {
        //   'Authorization': 'Bearer $token',
        // },
      );

      print(res.body);

      if (res.statusCode == 200) {
        List<UserModel> users = List<UserModel>.from(
          jsonDecode(res.body).map(
            (user) => UserModel.fromJson(user),
          ),
        ).toList();

        return users;
      }

      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUsers() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/transfer_histories'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print(res.body);

      if (res.statusCode == 200) {
        List<UserModel> users = List<UserModel>.from(
          jsonDecode(res.body)['data'].map(
            (user) => UserModel.fromJson(user),
          ),
        ).toList();

        return users;
      }

      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
