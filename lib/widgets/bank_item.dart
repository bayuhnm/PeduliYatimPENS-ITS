import 'dart:async';

import 'package:peduli_yatim_pens_mobile/global/theme.dart';
import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/models/payment_method_model.dart';

class BankItem extends StatelessWidget {
  final PaymentMethodModel data;
  final bool isSelected;
  String urlImage = 'https://donasi.peduliyatim.or.id/img/pembayaran/';

  BankItem({
    Key? key,
    required this.data,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected ? blueColor : backgroundGreyColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            urlImage + data.logo!,
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.name.toString().toUpperCase(),
                style: darkTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 mins',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
