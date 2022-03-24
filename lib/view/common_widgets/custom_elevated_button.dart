import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton {
  static customElevatedButton(
      {VoidCallback? onTap,
      String? btnName,
      FontWeight? fontWeight,
      Color? backgroundColor,
      double? height,
      double? width,
      double? fontSize,
      Color? fontColors}) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          btnName.toString(),
          style: TextStyle(
              fontSize: fontSize, color: fontColors, fontWeight: fontWeight),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor!),
        ),
      ),
    );
  }
}
