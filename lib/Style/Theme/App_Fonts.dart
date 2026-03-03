import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTexts {
  static TextStyle _fontStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color color = Colors.white,
    double? height,
  }) {
    return GoogleFonts.cairo(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  /// ========================== HEADINGS ================================ ///

  // Display 1 - 32px
  static final display1Bold = _fontStyle(fontSize: 32, fontWeight: FontWeight.w700);
  static final display1Accent = _fontStyle(fontSize: 32, fontWeight: FontWeight.w600);
  static final display1Emphasis = _fontStyle(fontSize: 32, fontWeight: FontWeight.w500);
  static final display1Standard = _fontStyle(fontSize: 32, fontWeight: FontWeight.w400);

  // Heading 1 - 28px
  static final heading1Bold = _fontStyle(fontSize: 28, fontWeight: FontWeight.w700);
  static final heading1Accent = _fontStyle(fontSize: 28, fontWeight: FontWeight.w600);
  static final heading1Emphasis = _fontStyle(fontSize: 28, fontWeight: FontWeight.w500);
  static final heading1Standard = _fontStyle(fontSize: 28, fontWeight: FontWeight.w400);

  // Heading 2 - 24px
  static final heading2Bold = _fontStyle(fontSize: 24, fontWeight: FontWeight.w700);
  static final heading2Accent = _fontStyle(fontSize: 24, fontWeight: FontWeight.w600);
  static final heading2Emphasis = _fontStyle(fontSize: 24, fontWeight: FontWeight.w500, height: 1.2);
  static final heading2Standard = _fontStyle(fontSize: 24, fontWeight: FontWeight.w400, height: 1.2);

  // Heading 3 - 20px
  static final heading3Bold = _fontStyle(fontSize: 20, fontWeight: FontWeight.w700);
  static final heading3Accent = _fontStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static final heading3Emphasis = _fontStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static final heading3Standard = _fontStyle(fontSize: 20, fontWeight: FontWeight.w400);

  /// ========================== BODY TEXT =============================== ///

  // Feature - 18px
  static final featureBold = _fontStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static final featureAccent = _fontStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static final featureEmphasis = _fontStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static final featureStandard = _fontStyle(fontSize: 18, fontWeight: FontWeight.w400);

  // Highlight - 16px
  static final highlightBold = _fontStyle(fontSize: 16, fontWeight: FontWeight.w700);
  static final highlightAccent = _fontStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static final highlightEmphasis = _fontStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static final highlightStandard = _fontStyle(fontSize: 16, fontWeight: FontWeight.w400);

  // Content - 14px
  static final contentBold = _fontStyle(fontSize: 14, fontWeight: FontWeight.w700);
  static final contentAccent = _fontStyle(fontSize: 14, fontWeight: FontWeight.w600);
  static final contentEmphasis = _fontStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static final contentRegular = _fontStyle(fontSize: 14, fontWeight: FontWeight.w400);

  // Caption - 12px
  static final captionBold = _fontStyle(fontSize: 12, fontWeight: FontWeight.w700);
  static final captionAccent = _fontStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static final captionEmphasis = _fontStyle(fontSize: 12, fontWeight: FontWeight.w500);
  static final captionRegular = _fontStyle(fontSize: 12, fontWeight: FontWeight.w400);

  // Footnote - 10px
  static final footnoteBold = _fontStyle(fontSize: 10, fontWeight: FontWeight.w600);
  static final footnoteAccent = _fontStyle(fontSize: 10, fontWeight: FontWeight.w600);
  static final footnoteEmphasis = _fontStyle(fontSize: 10, fontWeight: FontWeight.w500);
  static final footnoteRegular = _fontStyle(fontSize: 10, fontWeight: FontWeight.w400);
}