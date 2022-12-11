// ignore: unnecessary_import
import 'dart:ui';
import 'package:flutter/material.dart';

Color primary = const Color(0xFF687daf);
class Styles{
  static Color primarycolor = primary;
  static Color textcolor = const Color(0xFF3b3b3b);
  // ignore: non_constant_identifier_names
  static Color textcolor_negative = const Color(0xFFeeedf2);
  static Color bgcolor = const Color(0xFFeeedf2);
  static Color themePurple = const Color(0xFFa20589);
  static TextStyle textStyle = TextStyle(fontSize: 16, color: textcolor, fontWeight: FontWeight.w500);
  static TextStyle header1 = TextStyle(fontSize: 40, color: textcolor, fontWeight: FontWeight.bold);
  static TextStyle header2 = TextStyle(fontSize: 26, color: textcolor, fontWeight: FontWeight.bold);
  static TextStyle header3 = TextStyle(fontSize: 18, color: Colors.grey.shade700, fontWeight: FontWeight.bold);
  static TextStyle header4 = TextStyle(fontSize: 15, color: Colors.grey.shade500, fontWeight: FontWeight.normal);
}