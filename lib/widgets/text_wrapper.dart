import 'package:flutter/material.dart';
import 'package:peduli_yatim_pens_mobile/global/theme.dart';

class TextWrapper extends StatefulWidget {
  const TextWrapper({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<TextWrapper> createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: ConstrainedBox(
              constraints: isExpanded
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 130),
              child: Text(
                widget.text,
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                  height: 1.3
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      isExpanded
          ? OutlinedButton.icon(
              icon: const Icon(Icons.arrow_upward, size: 20,),
              label: const Text('Read less',style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 12
              )),
              onPressed: () => setState(() => isExpanded = false))
          : OutlinedButton.icon(
              icon: const Icon(Icons.arrow_downward, size: 20),
              label: const Text('Read more',style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 12)),
              onPressed: () => setState(() => isExpanded = true))
    ]);
  }
}