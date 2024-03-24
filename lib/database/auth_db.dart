import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_data_login.dart';

Future<Database> openDatabaseConnectionAuth() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'intellicane_account.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      db.execute(
          'CREATE TABLE IF NOT EXISTS user (id TEXT, password TEXT, role TEXT)');
    },
  );
}

Future<Database> initDBPatientMonitoring() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'intellicane_Monitoring.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      db.execute(
          'CREATE TABLE IF NOT EXISTS user (id TEXT, password TEXT, role TEXT)');
    },
  );
}

Future<void> saveUserData(DataLoginUser user) async {
  final Database database = await openDatabaseConnectionAuth();

  // Insert the user into the user table
  await database.insert('user', user.toMap());
}

Future<List<DataLoginUser>> getUserData() async {
  final Database database = await openDatabaseConnectionAuth();

  // Query all rows from the user table
  final List<Map<String, dynamic>> maps = await database.query('user');

  // Convert the List<Map<String, dynamic>> to a List<DataLoginUser>
  return List.generate(maps.length, (index) {
    return DataLoginUser(
      id: maps[index]['id'],
      password: maps[index]['password'],
      role: maps[index]['role'],
    );
  });
}

DataLoginUser selectedAccount = DataLoginUser(id: "", password: "", role: "");
Future<bool> matchUserData(DataLoginUser inputUser) async {
  // Get the user data from the database
  List<DataLoginUser> users = await getUserData();

  // Check if the user ID and password match
  for (DataLoginUser user in users) {
    if (user.id == inputUser.id &&
        user.password == inputUser.password &&
        user.role == inputUser.role) {
      selectedAccount = DataLoginUser(
          id: inputUser.id, password: inputUser.password, role: inputUser.role);
      return true;
    }
  }

  return false;
}

void showUserData() async {
  List<DataLoginUser> users = await getUserData();

  // Display user data
  for (DataLoginUser user in users) {
    print(
        'User ID: ${user.id}, Password: ${user.password}, Role: ${user.role}');
  }
}

void insertExample() async {
  DataLoginUser newUser =
      DataLoginUser(id: "sadads", password: 'qweqew', role: 'Guardian');

  await saveUserData(newUser);
  showUserData();
}
