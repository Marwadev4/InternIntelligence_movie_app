import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Upcoming feature',
          style: TextStyles.font20Gray500,
        ),
      ),
    );
  }
}
