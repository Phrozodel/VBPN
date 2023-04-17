import 'package:flutter/material.dart';
import '../ressources/appbar_config.dart';
import '../ressources/boutons_config.dart';

import 'accueil.dart';

/* class personnes extends StatelessWidget {
  personnes({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un utilisateur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => personnes()),
                );
              },
              child: Text('Ajouter un utilisateur'),
            )
          ],
        ),
      ),
    );
  }
} */

/* class personnes extends StatefulWidget {
  personnes({required, required this.title}) : super(key: key);

  final String title;
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _accessLevelController = TextEditingController();

  List<personnes> _users = [];

  void _addUser() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _users.add(personnes(
          _nameController.text,
          _passwordController.text,
          _accessLevelController.text,
        ));
        _nameController.clear();
        _passwordController.clear();
        _accessLevelController.clear();
      });
    }
  }

  void _deleteUser(int index) {
    setState(() {
      _users.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _accessLevelController,
                  decoration: InputDecoration(labelText: 'Access Level'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter an access level';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: _addUser,
                  child: Text('Add User'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                personnes user = _users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(
                      'Password: ${user.password}, Access Level:${user.accessLevel}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteUser(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBarConfig.getBarBottom(),
    );
  }
}

void main() => runApp(MyApp()); */

//class personnes extends StatefulWidget {
//personnes({required Key key, required this.title}) : super(key: key);
// personnes({required Key key, required this.title}) : super(key: key);

class Personnes extends StatefulWidget {
  final String title;

  const Personnes({required Key key, @required required this.title})
      : super(key: key);

  @override
  _PersonnesState createState() => _PersonnesState();
}

class _PersonnesState extends State<Personnes> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _registeredUsers = <Map<String, String>>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Veuillez entrer un nom d\'utilisateur';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Veuillez entrer un mot de passe';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() {
                    _registeredUsers.add({
                      'username': _usernameController.text,
                      'password': _passwordController.text,
                    });
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Enregistrement en cours...')));
                }
              },
              child: Text('Enregistrer'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _registeredUsers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      // title: Text(_registeredUsers[index]['username']),
                      //subtitle: Text(_registeredUsers[index]['password']),
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
