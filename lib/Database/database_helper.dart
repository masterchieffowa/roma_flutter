// // import 'package:sqflite/sqflite.dart';
// // import 'package:path/path.dart';
// //
// // class DatabaseHelper {
// //   static final DatabaseHelper _instance = DatabaseHelper._internal();
// //   factory DatabaseHelper() => _instance;
// //   DatabaseHelper._internal();
// //
// //   static Database? _database;
// //
// //   Future<Database> get database async {
// //     if (_database != null) return _database!;
// //     _database = await _initDatabase();
// //     return _database!;
// //   }
// //
// //   Future<Database> _initDatabase() async {
// //     final dbPath = await getDatabasesPath();
// //     final path = join(dbPath, 'romisaadb.db');
// //     return await openDatabase(
// //       path,
// //       version: 1,
// //       onCreate: _onCreate,
// //     );
// //   }
// //
// //   Future<void> _onCreate(Database db, int version) async {
// //     await db.execute('''
// //       CREATE TABLE user (
// //         id INTEGER PRIMARY KEY AUTOINCREMENT,
// //         username TEXT NOT NULL,
// //         password TEXT NOT NULL,
// //         role TEXT NOT NULL
// //       )
// //     ''');
// //
// //     await db.execute('''
// //       CREATE TABLE patient (
// //         id INTEGER PRIMARY KEY AUTOINCREMENT,
// //         name TEXT NOT NULL,
// //         phone TEXT NOT NULL,
// //         gender TEXT NOT NULL,
// //         address TEXT NOT NULL,
// //         marital_status TEXT NOT NULL,
// //         job TEXT NOT NULL
// //       )
// //     ''');
// //
// //     await db.execute('''
// //       CREATE TABLE medical_record_fixed (
// //         id INTEGER PRIMARY KEY AUTOINCREMENT,
// //         patient_id INTEGER,
// //         blood_type TEXT NOT NULL,
// //         description TEXT NOT NULL,
// //         FOREIGN KEY (patient_id) REFERENCES patient (id)
// //       )
// //     ''');
// //
// //     await db.execute('''
// //       CREATE TABLE medical_record_variable (
// //         id INTEGER PRIMARY KEY AUTOINCREMENT,
// //         patient_id INTEGER,
// //         height REAL NOT NULL,
// //         weight REAL NOT NULL,
// //         vitamins TEXT,
// //         minerals TEXT,
// //         description TEXT NOT NULL,
// //         FOREIGN KEY (patient_id) REFERENCES patient (id)
// //       )
// //     ''');
// //
// //     await db.execute('''
// //       CREATE TABLE appointment (
// //         id INTEGER PRIMARY KEY AUTOINCREMENT,
// //         patient_id INTEGER,
// //         date TEXT NOT NULL,
// //         status TEXT NOT NULL,
// //         FOREIGN KEY (patient_id) REFERENCES patient (id)
// //       )
// //     ''');
// //
// //     await db.execute('''
// //       CREATE TABLE case_cost (
// //         id INTEGER PRIMARY KEY AUTOINCREMENT,
// //         case_type TEXT NOT NULL,
// //         cost REAL NOT NULL
// //       )
// //     ''');
// //   }
// // }
//
// // import 'package:sqflite/sqflite.dart';
// // import 'package:path/path.dart';
// //
// // class DatabaseHelper {
// //   static final DatabaseHelper _instance = DatabaseHelper._internal();
// //   factory DatabaseHelper() => _instance;
// //   DatabaseHelper._internal();
// //
// //   static Database? _database;
// //
// //   Future<Database> get database async {
// //     if (_database != null) return _database!;
// //     _database = await _initDatabase();
// //     return _database!;
// //   }
// //
// //   Future<Database> _initDatabase() async {
// //     final dbPath = await getDatabasesPath();
// //     final path = join(dbPath, 'example.db');
// //
// //     return await openDatabase(
// //       path,
// //       version: 1,
// //       onCreate: _onCreate,
// //     );
// //   }
// //
// //   Future<void> _onCreate(Database db, int version) async {
// //     await db.execute('''
// //       CREATE TABLE items (
// //         id INTEGER PRIMARY KEY AUTOINCREMENT,
// //         name TEXT NOT NULL
// //       )
// //     ''');
// //   }
// //
// //   Future<void> insertItem(String name) async {
// //     final db = await database;
// //     await db.insert('items', {'name': name});
// //   }
// //
// //   Future<List<String>> getItems() async {
// //     final db = await database;
// //     final List<Map<String, dynamic>> maps = await db.query('items');
// //     return List.generate(maps.length, (i) => maps[i]['name'] as String);
// //   }
// // }
//
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;
//   DatabaseHelper._internal();
//
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDatabase();
//     return _database!;
//   }
//
//   Future<Database> initDatabase() async {
//     print("Initializing database...");
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'romisaadb.db');
//     final db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//     print("Database initialized.");
//     return db;
//   }
//
//
//   Future<void> _onCreate(Database db, int version) async {
//     print("Creating tables...");
//     await db.execute('''CREATE TABLE patient (
//     id INTEGER PRIMARY KEY AUTOINCREMENT,
//     name TEXT NOT NULL,
//     phone TEXT NOT NULL,
//     gender TEXT NOT NULL,
//     address TEXT NOT NULL,
//     marital_status TEXT NOT NULL,
//     job TEXT NOT NULL
//   )''');
//     print("Tables created.");
//
//     await db.execute('''
//       CREATE TABLE patient (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT NOT NULL,
//         phone TEXT NOT NULL,
//         gender TEXT NOT NULL,
//         address TEXT NOT NULL,
//         marital_status TEXT NOT NULL,
//         job TEXT NOT NULL
//       )
//     ''');
//
//     await db.execute('''
//       CREATE TABLE medical_record_fixed (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         patient_id INTEGER,
//         blood_type TEXT NOT NULL,
//         description TEXT NOT NULL,
//         FOREIGN KEY (patient_id) REFERENCES patient (id)
//       )
//     ''');
//
//     await db.execute('''
//       CREATE TABLE medical_record_variable (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         patient_id INTEGER,
//         height REAL NOT NULL,
//         weight REAL NOT NULL,
//         vitamins TEXT,
//         minerals TEXT,
//         description TEXT NOT NULL,
//         FOREIGN KEY (patient_id) REFERENCES patient (id)
//       )
//     ''');
//
//     await db.execute('''
//       CREATE TABLE appointment (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         patient_id INTEGER,
//         date TEXT NOT NULL,
//         status TEXT NOT NULL,
//         FOREIGN KEY (patient_id) REFERENCES patient (id)
//       )
//     ''');
//
//     await db.execute('''
//       CREATE TABLE case_cost (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         case_type TEXT NOT NULL,
//         cost REAL NOT NULL
//       )
//     ''');
//   }
//
//   Future<void> insertPatient(String name, String phone, String gender, String address, String maritalStatus, String job) async {
//     final db = await database;
//     await db.insert('patient', {
//       'name': name,
//       'phone': phone,
//       'gender': gender,
//       'address': address,
//       'marital_status': maritalStatus,
//       'job': job,
//     });
//   }
//
//   Future<List<Map<String, dynamic>>> getPatients() async {
//     final db = await database;
//     return await db.query('patient');
//   }
//
// // Add methods to insert and retrieve data for your tables as needed.
// }
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    print("Initializing database...");
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'romisaadb.db');
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    print("Database initialized.");
    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    print("Creating tables...");

    // Create the patient table
    await db.execute('''CREATE TABLE patient (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      phone TEXT NOT NULL,
      gender TEXT NOT NULL,
      address TEXT NOT NULL,
      marital_status TEXT NOT NULL,
      job TEXT NOT NULL
    )''');

    // Create the medical_record_fixed table
    await db.execute('''CREATE TABLE medical_record_fixed (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      patient_id INTEGER,
      blood_type TEXT NOT NULL,
      description TEXT NOT NULL,
      FOREIGN KEY (patient_id) REFERENCES patient (id)
    )''');

    // Create the medical_record_variable table
    await db.execute('''CREATE TABLE medical_record_variable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      patient_id INTEGER,
      height REAL NOT NULL,
      weight REAL NOT NULL,
      vitamins TEXT,
      minerals TEXT,
      description TEXT NOT NULL,
      FOREIGN KEY (patient_id) REFERENCES patient (id)
    )''');

    // Create the appointment table
    await db.execute('''CREATE TABLE appointment (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      patient_id INTEGER,
      date TEXT NOT NULL,
      status TEXT NOT NULL,
      FOREIGN KEY (patient_id) REFERENCES patient (id)
    )''');

    // Create the case_cost table
    await db.execute('''CREATE TABLE case_cost (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      case_type TEXT NOT NULL,
      cost REAL NOT NULL
    )''');

    print("Tables created.");
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database upgrades (e.g., adding new columns or tables)
    if (oldVersion < newVersion) {
      // Perform any necessary migrations
    }
  }

  Future<void> insertPatient(String name, String phone, String gender, String address, String maritalStatus, String job) async {
    final db = await database;
    await db.insert('patient', {
      'name': name,
      'phone': phone,
      'gender': gender,
      'address': address,
      'marital_status': maritalStatus,
      'job': job,
    });
  }

  Future<List<Map<String, dynamic>>> getPatients() async {
    final db = await database;
    return await db.query('patient');
  }

// TODO: Add all methods you want to do.
}
