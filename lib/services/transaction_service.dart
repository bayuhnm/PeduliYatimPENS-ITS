import 'dart:convert';
import 'dart:developer';
import 'package:peduli_yatim_pens_mobile/models/payment_method_model.dart';
import 'package:http/http.dart' as http;
import 'package:peduli_yatim_pens_mobile/services/auth_service.dart';

class TransactionService {
  final String baseUrl = 'https://donasi.peduliyatim.or.id/api';

  Future<List<PaymentMethodModel>> getPaymentMethods() async {
  try {
    final res = await http.get(
      Uri.parse('$baseUrl/payment-methods'),
    );

    log(res.body);

    if (res.statusCode == 200) {
      List<PaymentMethodModel> paymentMethods = [];
      var jsonData = json.decode(res.body);
      List<dynamic> data = jsonData['data'];

      data.forEach((paymentMethod) {
        paymentMethods.add(PaymentMethodModel.fromJson(paymentMethod));
      });

      return paymentMethods;
    } else {
      throw jsonDecode(res.body)['message'];
    }
  } catch (e) {
    print(e);
    rethrow;
  }
}

  // Future<String> topUp(TopupFormModel data) async {
  //   try {
  //     print(data.toJson());
  //     final token = await AuthService().getToken();

  //     final res = await http.post(
  //       Uri.parse('$baseUrl/top_ups'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: data.toJson(),
  //     );

  //     print(res.body);

  //     if (res.statusCode == 200) {
  //       return jsonDecode(res.body)['redirect_url'];
  //     }

  //     throw jsonDecode(res.body)['message'];
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> transfer(TransferFormModel data) async {
  //   try {
  //     print(data.toJson());
  //     final token = await AuthService().getToken();

  //     final res = await http.post(
  //       Uri.parse('$baseUrl/transfers'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: data.toJson(),
  //     );

  //     print(res.body);
  //     print(res.statusCode);

  //     if (res.statusCode != 200) {
  //       throw jsonDecode(res.body)['message'];
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<List<OperatorCardModel>> getOperatorCards() async {
  //   try {
  //     final token = await AuthService().getToken();

  //     final res = await http.get(
  //       Uri.parse('$baseUrl/operator_cards'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     );

  //     if (res.statusCode == 200) {
  //       List<OperatorCardModel> users = List<OperatorCardModel>.from(
  //         jsonDecode(res.body)['data'].map(
  //           (operatorCard) => OperatorCardModel.fromJson(operatorCard),
  //         ),
  //       ).toList();

  //       return users;
  //     }

  //     return throw jsonDecode(res.body)['message'];
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> dataPlan(DataPlanFormModel data) async {
  //   try {
  //     print(data.toJson());
  //     final token = await AuthService().getToken();

  //     final res = await http.post(
  //       Uri.parse('$baseUrl/data_plans'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: data.toJson(),
  //     );

  //     print(res.body);
  //     print(res.statusCode);

  //     if (res.statusCode != 200) {
  //       throw jsonDecode(res.body)['message'];
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<List<TransactionModel>> getTransactions() async {
  //   try {
  //     final token = await AuthService().getToken();

  //     final res = await http.get(
  //       Uri.parse('$baseUrl/transactions'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //       },
  //     );

  //     print(res.body);

  //     if (res.statusCode == 200) {
  //       List<TransactionModel> transactions = List<TransactionModel>.from(
  //         jsonDecode(res.body)['data'].map(
  //           (transaction) => TransactionModel.fromJson(transaction),
  //         ),
  //       ).toList();

  //       return transactions;
  //     }

  //     return throw jsonDecode(res.body)['message'];
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
