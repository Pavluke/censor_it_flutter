import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static const normal = TextStyle(
    fontSize: 18,
    height: 1.5,
    color: Colors.black87,
  );

  static const censoredRed = TextStyle(
    fontSize: 18,
    height: 1.5,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  );

  static const censoredOrange = TextStyle(
    fontSize: 18,
    height: 1.5,
    color: Colors.orange,
    fontWeight: FontWeight.w900,
  );

  static const censoredBold = TextStyle(
    fontSize: 18,
    height: 1.5,
    fontWeight: FontWeight.bold,
  );

  static const censoredSpaced = TextStyle(
    fontSize: 18,
    height: 1.5,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );

  static const exampleLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const appBarTitle = TextStyle(fontWeight: FontWeight.w600);

  static const infoCardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const infoCardDescription = TextStyle(fontSize: 13);
}
