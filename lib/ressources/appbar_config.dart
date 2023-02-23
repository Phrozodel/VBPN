import 'package:flutter/material.dart';
import 'package:gestion_stocks_vbpn/ressources/boutons_config.dart';
import 'package:gestion_stocks_vbpn/screens/login.dart';
import '../screens/accueil.dart';

class AppBarConfig {
  static PreferredSizeWidget getBarTop(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leadingWidth: 96,
      leading: Row(
        children: [
          const BackButton(),
          BoutonsConfig.getIconButtonSimple(context, Icons.home, Colors.white,
              'Page d\'accueil', const Accueil()),
        ],
      ),
      titleSpacing: 28,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoutonsConfig.getIconButtonSimple(
              context, Icons.add, Colors.white, 'Ajouter', const Accueil()),
          BoutonsConfig.getIconButtonSimple(
              context, Icons.remove, Colors.white, 'Enlever', const Accueil()),
          BoutonsConfig.getIconButtonSimple(
              context, Icons.edit, Colors.white, 'Transfert', const Accueil()),
          BoutonsConfig.getIconButtonSimple(context, Icons.double_arrow,
              Colors.white, 'Transfert total', const Accueil()),
        ],
      ),
      actions: [
        BoutonsConfig.getIconButtonSimple(
            context, Icons.logout, Colors.white, 'Déconnexion', Login()),
      ],
    );
  }

  static PreferredSizeWidget getBarTopSimple(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: BoutonsConfig.getIconButtonSimple(context, Icons.home,
          Colors.white, 'Page d\'accueil', const Accueil()),
      titleSpacing: 28,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoutonsConfig.getIconButtonSimple(
              context, Icons.add, Colors.white, 'Ajouter', const Accueil()),
          BoutonsConfig.getIconButtonSimple(
              context, Icons.remove, Colors.white, 'Enlever', const Accueil()),
          BoutonsConfig.getIconButtonSimple(
              context, Icons.edit, Colors.white, 'Transfert', const Accueil()),
          BoutonsConfig.getIconButtonSimple(context, Icons.double_arrow,
              Colors.white, 'Transfert total', const Accueil()),
        ],
      ),
      actions: [
        BoutonsConfig.getIconButtonSimple(
            context, Icons.logout, Colors.white, 'Déconnexion', Login()),
      ],
    );
  }

  static Widget getBarBottom() {
    return BottomAppBar(
      color: Colors.blue,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
          ),
          Text(
            ' Gestion des stocks',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
