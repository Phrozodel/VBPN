import 'package:flutter/material.dart';
import '../ressources/appbar_config.dart';
import '../ressources/boutons_config.dart';
import '../ressources/table.dart';
import 'dart:async';
import 'accueil.dart';

class Visualisation extends StatefulWidget {
  const Visualisation({Key? key}) : super(key: key);

  @override
  _VisualisationState createState() => _VisualisationState();
}

class _VisualisationState extends State<Visualisation> {
  late List<Map<String, String>> _equipmentList = [];

  @override
  void initState() {
    super.initState();
    _loadEquipmentList();
  }

  Future<void> _loadEquipmentList() async {
    // Code to load the list of equipment from a database or API goes here
    _equipmentList = myEquipmentList;
    _equipmentList.sort((a, b) {
      if (a['localisation'] == null || b['localisation'] == null) {
        return 0;
      }
      int localisationComparison =
          a['localisation']!.compareTo(b['localisation']!);
      if (localisationComparison != 0) {
        return localisationComparison;
      } else {
        return a['name']!.compareTo(b['name']!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Liste du matériel'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(128.0, 16.0, 128.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40.0,
                  ),
                  Expanded(
                    flex: 6,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[200],
                      ),
                      child: Center(
                        child: EquipmentTable(equipmentList: _equipmentList),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.help),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 16.0,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBarConfig.getBarBottom(),
    );
  }
}
