import 'package:flutter/material.dart';
import '../ressources/appbar_config.dart';
import '../ressources/boutons_config.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarConfig.getBarTopSimple(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Positioned(
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BoutonsConfig.getIconButtonSimple(
                      context,
                      Icons.notifications,
                      Colors.black,
                      'Alertes',
                      const Accueil()),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Lieux'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Matériel'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Equipements'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Alimentation'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Personnes'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Statistiques'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Positioned(
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BoutonsConfig.getIconButtonSimple(context, Icons.help,
                      Colors.black, 'Aide', const Accueil()),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBarConfig.getBarBottom(),
    );
  }
}
