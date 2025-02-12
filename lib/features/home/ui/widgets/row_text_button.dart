import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/features/home/ui/widgets/text_button.dart';

class RowTextButton extends StatelessWidget {
  const RowTextButton({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Text(
          text,
          style: TextStyles.font30White600,
        ),
        Textbutton(
          text: 'See all',
          onPressed: onPressed,
        ),
      ],
    );
  }
}
