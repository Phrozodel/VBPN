import 'package:mysql1/mysql1.dart';
import 'dart:async';

class MySQL {
  static String host = 'vbpnfrestock1.mysql.db',
      user = 'vbpnfre-stock1',
      password = 'Pzx3R7aEgTFZ5vJqqk3oG42vYEiZk4',
      db = 'vbpnfrestock1';
  static int port = 22;

  MySQL();

  Future<MySqlConnection> open() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );
    return await MySqlConnection.connect(settings);
  }
}
