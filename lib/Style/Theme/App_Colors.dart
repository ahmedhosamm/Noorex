import 'package:flutter/material.dart';

import 'Hex_Color_Change.dart';

class AppColors {
// Primary Colors Green shades)
  static final primary100 = hexToColor('#b8f9e3');
  static final primary200 = hexToColor('#94f6d5');
  static final primary300 = hexToColor('#71f3c8');
  static final primary400 = hexToColor('#4df0ba');
  static final primary500 = hexToColor('#2aedac');
  static final primary600 = hexToColor('#13dd9a');
  static final primary700 = hexToColor('#10b981'); // Primary Main
  static final primary800 = hexToColor('#0d9165');
  static final primary900 = hexToColor('#096b49');
  static final primary1000 = hexToColor('#06402d');
  // Primary Main With 10% Opacity
  static Color primary10 = primary700.withValues(alpha: 0.1);

  // Secondary Colors (Blue-Grey shades)
  static final secondary100 = hexToColor('#a5b5cc');
  static final secondary200 = hexToColor('#7790b3');
  static final secondary300 = hexToColor('#526c91');
  static final secondary400 = hexToColor('#3b4b64');
  static final secondary500 = hexToColor('#1f2937'); // Secondary Main
  // Secondary Main With 10% Opacity
  static Color secondary10 = secondary500.withValues(alpha: 0.1);

// Neutral Colors (Greyscale)
  static final neutral100 = hexToColor('#fcfcfc');
  static final neutral200 = hexToColor('#e6e6e6');
  static final neutral300 = hexToColor('#cfcfcf');
  static final neutral400 = hexToColor('#b9b9b9');
  static final neutral500 = hexToColor('#a3a3a3');
  static final neutral600 = hexToColor('#8c8c8c');
  static final neutral700 = hexToColor('#767676');
  static final neutral800 = hexToColor('#494949');
  static final neutral900 = hexToColor('#494949');
  static final neutral1000 = hexToColor('#333333');
  // Neutral Colors With 10% Opacity
  static Color neutra10 = neutral1000.withValues(alpha: 0.1);

  // Red Colors (Feedback)
  static final red100 = hexToColor('#fb3748');
  static final red200 = hexToColor('#d00416');
  // Red Colors (Feedback) With 10% Opacity
  static Color red10 = red100.withValues(alpha: 0.1);

  // Yellow Colors (Feedback)
  static final yellow100 = hexToColor('#ffdb43');
  static final yellow200 = hexToColor('#dfb400');
  // Yellow Colors (Feedback) With 10% Opacity
  static Color yellow10 = yellow100.withValues(alpha: 0.1);

  // Green Colors (Feedback)
  static final green100 = hexToColor('#84ebb4');
  static final green200 = hexToColor('#1fc16b');
  // Green Colors (Feedback) With 10% Opacity
  static Color green10 = green200.withValues(alpha: 0.1);

}
