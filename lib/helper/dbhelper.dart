import 'dart:async';
import 'dart:io';

import 'package:etsbiodata/models/biodata.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'Biodata.db';

    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    return todoDatabase;
  }

  void _createDb(Database db, int version) async {

    await db.execute('''
      CREATE TABLE biodata (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        nbi TEXT,
        alamat TEXT,
        ipk TEXT,
        spp TEXT,
        prodi TEXT,
        tglLahir TEXT,
        wali TEXT,
        kelamin TEXT,
        fakultas TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  // Read (R)
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('biodata', orderBy: 'nama');
    return mapList;
  }

  // Create (C)
  Future<int> insert(Biodata object) async {
    Database db = await this.database;
    int count = await db.insert('biodata', object.toMap());
    return count;
  }

  // Update (U)
  Future<int> update(Biodata object) async {
    Database db = await this.database;
    int count = await db.update('biodata', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  // Delete (D)
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('biodata', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Biodata>> getBiodataList() async {
    var biodataMapList = await select();
    int count = biodataMapList.length;
    List<Biodata> biodataList = List<Biodata>();
    for (int i = 0; i < count; i++) {
      biodataList.add(Biodata.fromMap(biodataMapList[i]));
    }
    return biodataList;
  }
}
