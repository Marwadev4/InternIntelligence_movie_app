import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/styles.dart';

class ExpandedText extends StatefulWidget {
  final String overview;

  const ExpandedText({super.key, required this.overview});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: isExpanded
                  ? widget.overview
                  : '${widget.overview.substring(0, 120)}...',
              style: TextStyles.font18Gray500,
            ),
            TextSpan(
              text: isExpanded ? ' Read less' : ' Read more',
              style: TextStyles.font18PrimaryTextColor500,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
            ),
          ],
        ),
      ),
    );
  }
}
