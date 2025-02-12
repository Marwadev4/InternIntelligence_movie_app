import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/styles.dart';

class Textbutton extends StatelessWidget {
  const Textbutton({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.font20Gray500,
      ),
    );
  }
}
