import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgUtil {
  static Widget load(String assetPath) {
    final Widget svgIcon = SvgPicture.asset(
      assetPath,
      semanticsLabel: 'A red up arrow',
    );

    return svgIcon;
  }
}
