import 'package:flutter/material.dart';

class Tools {
  static void navigatorNewPage(BuildContext context, Widget newPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return newPage;
      }),
    );
  }
}
