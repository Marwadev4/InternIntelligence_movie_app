import 'package:flutter/material.dart';

class NavbarModel {
  final IconData icon;
  final int index;
  final Widget screen;

  NavbarModel({
    required this.icon,
    required this.index,
    required this.screen,
  });
}
