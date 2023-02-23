import 'package:flutter/material.dart';
import '../ressources/tools.dart';

class BoutonsConfig {
  static Widget getIconButtonSimple(BuildContext context, IconData iconSpe,
      Color couleur, String what, Widget newPage) {
    return IconButton(
      icon: Icon(iconSpe),
      tooltip: what,
      color: couleur,
      onPressed: () {
        Tools.navigatorNewPage(context, newPage);
      },
    );
  }

  static Widget getElevatedButtonSimple(
      BuildContext context, Widget newPage, String name) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 50,
        width: 250,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 22),
          ),
          onPressed: () {
            Tools.navigatorNewPage(context, newPage);
          },
          child: Text(name),
        ),
      ),
    );
  }
}
