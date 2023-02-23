import 'package:flutter/material.dart';
import 'package:gestion_stocks_vbpn/database/mysql.dart';
import 'package:gestion_stocks_vbpn/ressources/appbar_config.dart';
import 'package:gestion_stocks_vbpn/screens/accueil.dart';

import '../ressources/tools.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String utilisateur;
  late String mdp;
  var db = MySQL();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Formulaire utilisateur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Nom d\'utilisateur',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Renseignez le nom d\'utilisateur';
                          }
                          utilisateur = value;
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Mot de passe',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Renseignez le mot de passe';
                          }
                          mdp = value;
                          return null;
                        },
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 25.0),
                          width: 200,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState!.validate()) {
                                if (utilisateur == 'Louis' && mdp == '12345') {
                                  Tools.navigatorNewPage(
                                      context, const Accueil());
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          'Mauvais nom d\'utilisateur ou mauvais mot de passe'),
                                      action: SnackBarAction(
                                        label: 'Annuler',
                                        onPressed: () {},
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text(
                              'Se connecter',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBarConfig.getBarBottom(),
    );
  }
}
