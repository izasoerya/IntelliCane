import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user_data.dart';

Future<Database> openDatabaseConnection() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'intellicane.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      db.execute(
          'CREATE TABLE IF NOT EXISTS user (id TEXT, password TEXT, role TEXT)');
    },
  );
}

Future<void> saveUserData(DataUser user) async {
  final Database database = await openDatabaseConnection();

  // Insert the user into the user table
  await database.insert('user', user.toMap());
}

Future<List<DataUser>> getUserData() async {
  final Database database = await openDatabaseConnection();

  // Query all rows from the user table
  final List<Map<String, dynamic>> maps = await database.query('user');

  // Convert the List<Map<String, dynamic>> to a List<DataUser>
  return List.generate(maps.length, (index) {
    return DataUser(
      id: maps[index]['id'],
      password: maps[index]['password'],
      role: maps[index]['role'],
    );
  });
}

void showUserData() async {
  List<DataUser> users = await getUserData();

  // Display user data
  for (DataUser user in users) {
    print(
        'User ID: ${user.id}, Password: ${user.password}, Role: ${user.role}');
  }
}

void insertExample() async {
  DataUser newUser =
      DataUser(id: "sadads", password: 'qweqew', role: 'Guardian');

  await saveUserData(newUser);

  // Show updated user data after insertion
  showUserData();
}
