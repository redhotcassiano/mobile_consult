import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart = const Color(0xFFf0db80);
  static const Color loginGradientEnd = const Color(0xFFff8650);
  static const Color fontWhite = const Color(0xFFFFFFFF);
  static const Color fontBlack = const Color(0xFF000000);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}