// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:webview_flutter/webview_flutter.dart';

// class DonationPage extends StatefulWidget {
//   @override
//   _DonationPageState createState() => _DonationPageState();
// }

// class _DonationPageState extends State<DonationPage> {
//   final TextEditingController _programController = TextEditingController();
//   final TextEditingController _nominalController = TextEditingController();

//   Future<void> _submitDonation() async {
//     final String serverKey = 'SB-Mid-server-27hwl0FlW1MBI3xJlF6ofWVj'; // Replace with your Midtrans Server Key

//     String programName = _programController.text;
//     String nominal = _nominalController.text;

//     Map<String, dynamic> requestBody = {
//       'transaction_details': {
//         'order_id': DateTime.now().millisecondsSinceEpoch.toString(),
//         'gross_amount': nominal
//       },
//       'item_details': [
//         {'id': 'donation', 'price': nominal, 'quantity': 1, 'name': programName}
//       ]
//     };

//     String url = 'https://app.sandbox.midtrans.com/snap/v1/transactions';
//     final http.Response response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Basic ' + base64Encode(utf8.encode('$serverKey:')),
//       },
//       body: jsonEncode(requestBody),
//     );

//     if (response.statusCode == 201) {
//       // Successfully created payment transaction
//       Map<String, dynamic> responseData = jsonDecode(response.body);
//       String redirectUrl = responseData['redirect_url'];

//       Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewPage(url: redirectUrl)));

//       print('Successfully created payment transaction');
//     } else {
//       // Failed to create payment transaction
//       print('Failed to create payment transaction');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Donation Page'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _programController,
//               decoration: InputDecoration(
//                 labelText: 'Donation Program Name',
//               ),
//             ),
//             TextFormField(
//               controller: _nominalController,
//               decoration: InputDecoration(
//                 labelText: 'Donation Amount',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _submitDonation,
//               child: Text('Donate Now'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class WebViewPage extends StatelessWidget {
//   final String url;

//   WebViewPage({required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Page'),
//       ),
//       body: WebView(
//         initialUrl: url,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
