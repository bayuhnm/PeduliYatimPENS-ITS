import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midtrans_snap/midtrans_snap.dart';
import 'package:midtrans_snap/models.dart';
import 'package:midtrans_snap/constants.dart';
import 'package:http/http.dart' as http;

class MidtransPage extends StatefulWidget {
  final String amountDonation;

  const MidtransPage({Key? key, required this.amountDonation}) : super(key: key);

  @override
  State<MidtransPage> createState() => _MidtransPageState();
}

class _MidtransPageState extends State<MidtransPage> {
  String? snapId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSnapId(widget.amountDonation);
  }

  Future<void> fetchSnapId(String amountDonation) async {
    String userId = '11';
    String programId = '8';
    String isAnonim = '1';

    try {
      var url = Uri.parse('https://donasi.peduliyatim.or.id/api/donate');
      var response = await http.post(
        url,
        body: {
          'user_id': userId,
          'program_id': programId,
          'amount_donation': amountDonation,
          'is_anonim': isAnonim,
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var snapId = jsonResponse['data']['snap_id'];
        print('Snap ID: $snapId');
        setState(() {
          this.snapId = snapId;
          isLoading = false;
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching snapId: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : MidtransSnap(
              mode: MidtransEnvironment.sandbox,
              token: '${snapId}', // Pass the snapId variable here
              midtransClientKey: 'SB-Mid-client-4ooGscwcUeWbvLN4',
              onPageFinished: (url) {
                print(url);
              },
              onPageStarted: (url) {
                print(url);
              },
              onResponse: (result) {
                print(result.toJson());
              },
            ),
    );
  }
}
