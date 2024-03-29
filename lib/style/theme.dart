import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart = const Color(0xFF43cea2 );
  static const Color loginGradientEnd = const Color(0xFF185a9d);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.5, 1.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}