import 'package:flutter/material.dart';

abstract class AppConsts {
  static const Color mainColor = Colors.blue;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color orange = Color.fromRGBO(255, 221, 79, 1);
  static const Color red = Colors.red;
  static const Color previewColor = Color.fromRGBO(239, 130, 98, 1);
  static BoxDecoration decorationImage = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: AppConsts.mainColor,
      width: 1,
    ),
  );
  static OutlineInputBorder decoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(width: 1, color: mainColor),
  );

  static const style14 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.grey,
  );
  static const style16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const style18 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: white,
  );
  static const style20 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
  static const style30 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    // fontFamily: "G TSectra Fine",
  );
  static OutlineInputBorder borderSearchField = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
  );
  static const TextStyle styleError = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
}
