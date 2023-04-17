import 'package:flutter/material.dart';
import '../ressources/appbar_config.dart';
import '../ressources/boutons_config.dart';
import 'package:gestion_stocks_vbpn/ressources/tools.dart';
import '../screens/visualisation.dart';
import '../screens/Person.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              BoutonsConfig.getIconButtonSimple(context, Icons.notifications,
                  Colors.black, 'Alertes', const Accueil()),
            ],
          ),
          Center(
            child: SizedBox(
              height: 450,
              width: 300,
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Lieux'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Matériel'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Visualisation(), 'Liste des Equipements'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Alimentation'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, Person(), 'Personnes'),
                  BoutonsConfig.getElevatedButtonSimple(
                      context, const Accueil(), 'Statistiques'),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              BoutonsConfig.getIconButtonSimple(
                  context, Icons.help, Colors.black, 'Aide', const Accueil()),
            ],
          ),
        ],
      ),
      bottomNavigationBar: AppBarConfig.getBarBottom(),
    );
  }
}
