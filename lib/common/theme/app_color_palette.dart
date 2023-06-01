import 'package:flutter/material.dart';

// This class used to check the network connectivity
class AppColorPalette {
  final MaterialColor primarySwatch;
  final MaterialColor secondarySwatch;
  final MaterialColor additionalSwatch1;
  final MaterialColor whiteColorPrimary;
  final MaterialColor yellowColorPrimary;
  final Color transparentColor;
  final Color backgroundColor;
  final Color backgroundColorSecondary;
  final Color redColor;
  final MaterialColor blackColorPrimary;

  const AppColorPalette({
    required this.primarySwatch,
    required this.secondarySwatch,
    required this.additionalSwatch1,
    required this.whiteColorPrimary,
    required this.blackColorPrimary,
    required this.yellowColorPrimary,
    required this.transparentColor,
    required this.backgroundColor,
    required this.backgroundColorSecondary,
    required this.redColor,
  });
}

const AppColorPalette lightColorPalette = AppColorPalette(
  primarySwatch: MaterialColor(800, {
    900: Colors.brown,
  }),
  secondarySwatch: MaterialColor(600, {
  }),
  additionalSwatch1: MaterialColor(800, {
  }),

  whiteColorPrimary: MaterialColor(900, {
    900:  Color(0xFFFFFFFF),
    800:Color(0xFFFAFAFA),
    700:Color(0xFFF5F5F5),
    600:Color(0xFFF9F9F9),

  }),

  blackColorPrimary: MaterialColor(900, {
    900:  Color(0xFF000000),
    800:  Colors.grey,
  }),


  yellowColorPrimary: MaterialColor(900, {
  }),

  transparentColor: Colors.transparent,
  redColor: Colors.red,
  backgroundColor: Color(0xFFFFF7F0),
  backgroundColorSecondary: Color(0xFFFFFFFF),

);
