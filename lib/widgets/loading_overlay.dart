import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.black54,
          dismissible: false,
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
