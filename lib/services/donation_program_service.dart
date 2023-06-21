import 'dart:convert';
import 'dart:developer';
import 'package:peduli_yatim_pens_mobile/models/donation_program_model.dart';
import 'package:http/http.dart' as http;
import 'package:peduli_yatim_pens_mobile/services/auth_service.dart';

class DonationProgramService {
  final String baseUrl = 'https://donasi.peduliyatim.or.id/api';

  Future<List<DonationProgramModel>> getDonationPrograms() async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/donate-programs'),
      );

      log(res.body);

      if (res.statusCode == 200) {
        List<DonationProgramModel> donationPrograms = [];
        var jsonData = json.decode(res.body);
        List<dynamic> data = jsonData['data'];

        data.forEach((donationProgram) {
          donationPrograms.add(DonationProgramModel.fromJson(donationProgram));
        });

        return donationPrograms;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
