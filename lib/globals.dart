import 'package:flutter/material.dart';

class Globals {
  // Replace the RGB values with your desired colors
  static const Color buttonColor = Color(0xFF00FF00); // RGB: 0, 255, 0
  static const Color headingTextColor = Color(0xFF07052A); // Hex: #07052A
  static const Color dullTextColor = Color(0xFF8C919D); // Hex: #8C919D
  static const Color greenTextColor = Color(0xFF2CA66F); // Hex: #2CA66F
  static const Color highlightColorText = Color(0xFFE95F36); // Hex: #E95F36

    // Gradient for Button
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFF6633FF), // Hex: #6633FF
      Color(0xFF20BD52), // Hex: #20BD52
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
