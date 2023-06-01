import 'package:bloc_demo_project/common/theme/app_color_palette.dart';
import 'package:flutter/material.dart';

// This widget return the common app bar ui.
PreferredSizeWidget commonAppBar({required String title}){
  return AppBar(
    backgroundColor: lightColorPalette.primarySwatch.shade900,
    title: Text(title),
  );
}