import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff63c4bc, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff59b0a9), //10%
      100: const Color(0xff4f9d96), //20%
      200: const Color(0xff4f9d96), //30%
      300: const Color(0xff3b7671), //40%
      400: const Color(0xff32625e), //50%
      500: const Color(0xff284e4b), //60%
      600: const Color(0xff1e3b38), //70%
      700: const Color(0xff142726e), //80%
      800: const Color(0xff0a1413), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
