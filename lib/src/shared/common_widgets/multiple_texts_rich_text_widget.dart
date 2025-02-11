import 'package:flutter/material.dart';

class ShamaMultipleTextsRichText extends StatelessWidget {
  final Map<String, TextStyle> items;
  final TextAlign? textAlign;
  const ShamaMultipleTextsRichText({
    super.key,
    required this.items,
    this.textAlign
  });

  @override
  Widget build(context) {
    return Text.rich(
      textAlign: textAlign,
      maxLines: 5,
      TextSpan(
        children: items.entries.map(
          (item) => TextSpan(
            text: item.key,
            style: item.value
          )
        ).toList()
      )
    );
  }
}