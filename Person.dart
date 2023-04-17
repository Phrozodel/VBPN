import 'package:flutter/material.dart';
import '../ressources/appbar_config.dart';
import '../ressources/boutons_config.dart';

import 'accueil.dart';

/* class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _nom;
  String? _motDePasse;
  String? _email;
  final List<Map<String, dynamic>> _utilisateurs = [];
  void _enregistrer() {
    setState(() {
      _nom = _nomController.text;
      _motDePasse = _motDePasseController.text;
      _email = _emailController.text;
    });
  }

  void _supprimer() {
    setState(() {
      _nom = null;
      _motDePasse = null;
    });
  }

  void _mettreAJour() {
    setState(() {
      _nom = _nomController.text;
      _motDePasse = _motDePasseController.text;
      _email = _emailController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personnes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _motDePasseController,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _enregistrer,
                  child: const Text('Enregistrer'),
                ),
                ElevatedButton(
                  onPressed: _supprimer,
                  child: const Text('Supprimer'),
                ),
                ElevatedButton(
                  onPressed: _mettreAJour,
                  child: const Text('Mettre à jour'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            if (_nom != null && _motDePasse != null) ...[
              Text('Nom : $_nom'),
              Text('Mot de passe : $_motDePasse'),
            ]
          ],
        ),
      ),
    );
  }
}
 */
class Utilisateur {
  String nom;
  String motDePasse;

  Utilisateur({
    required this.nom,
    required this.motDePasse,
  });
}

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _motDePasseController = TextEditingController();

  final List<Utilisateur> _utilisateurs = [];

  void _enregistrer() {
    setState(() {
      _utilisateurs.add(Utilisateur(
        nom: _nomController.text,
        motDePasse: _motDePasseController.text,
      ));
    });
  }

  void _supprimer(int index) {
    setState(() {
      if (index >= 0 && index < _utilisateurs.length) {
        _utilisateurs.removeAt(index);
      }
    });
  }

  void _mettreAJour(int index) {
    setState(() {
      if (index >= 0 && index < _utilisateurs.length) {
        final utilisateur = _utilisateurs[index];
        utilisateur.nom = _nomController.text;
        utilisateur.motDePasse = _motDePasseController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _motDePasseController,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _enregistrer,
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _utilisateurs.length,
                itemBuilder: (context, index) {
                  final utilisateur = _utilisateurs[index];
                  return ListTile(
                    title: Text(utilisateur.nom),
                    subtitle: Text(utilisateur.motDePasse),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => {
                          _nomController.text = utilisateur.nom,
                          _motDePasseController.text = utilisateur.motDePasse,
                          _mettreAJour(index)
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => {_supprimer(index)},
                      ),
                    ]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
