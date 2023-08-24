import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextBoxInput extends StatelessWidget {
  const TextBoxInput(
      {required this.title,
      this.helperText,
      this.onSaved,
      required this.icon,
      this.maxLength,
      super.key});

  final String title;
  final String? helperText;
  final FaIcon icon;
  final int? maxLength;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      maxLines: maxLength,
      decoration: InputDecoration(
        hintText: title,
        helperText: helperText,
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
