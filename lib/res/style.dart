import 'package:flutter/material.dart';

customStyle(var fontSize, var color, var fontWeight) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

var defaultUnderLine = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: Colors.transparent,
  shadows: [
    Shadow(offset: Offset(0, -1), color: Color.fromRGBO(51, 138, 254, 1))
  ],
  decoration: TextDecoration.underline,
  decorationColor: Color.fromRGBO(51, 138, 254, 1),
);

var defaultUnder10Line = const TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.normal,
  color: Colors.transparent,
  shadows: [
    Shadow(offset: Offset(0, -1), color: Color.fromRGBO(51, 138, 254, 1))
  ],
  decoration: TextDecoration.underline,
  decorationColor: Color.fromRGBO(51, 138, 254, 1),
);