import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/constants/colors.dart';

SalomonBottomBarItem salomonBottomBarItem({
  required IconData icon,
  required String text,
}) =>
    SalomonBottomBarItem(
      icon: Icon(icon),
      title: Text(text),
      selectedColor: AppColors.defaultColor,
    );

List<SalomonBottomBarItem> bottomNavItems = [
  /// Home
  salomonBottomBarItem(icon: Icons.home, text: 'Home'),
  /// Category
  salomonBottomBarItem(icon: Icons.list_alt_outlined, text: 'Categories'),
  /// Favorite
  salomonBottomBarItem(icon: Icons.favorite_border, text: 'Favorite'),
  /// Settings
  salomonBottomBarItem(icon: Icons.settings, text: 'Settings'),

];
