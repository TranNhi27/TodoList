import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_app/models/Task.dart';

class TaskDatabase {
  static final TaskDatabase instance = TaskDatabase._init();

  static Database? _database;

  TaskDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('task.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final nullableTextType = 'TEXT';

    await db.execute('''
CREATE TABLE $tableTasks ( 
  ${TaskFields.id} $idType, 
  ${TaskFields.taskTitle} $textType,
  ${TaskFields.hour} $nullableTextType,
  ${TaskFields.date} $textType,
  ${TaskFields.description} $nullableTextType,
  ${TaskFields.value} $boolType
  )
''');
  }

  Future<Task> create(Task task) async {
    final db = await instance.database;

    final id = await db.insert(tableTasks, task.toJson());
    return task.copy(id: id);
  }

  Future<Task> readTask(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableTasks,
      columns: TaskFields.values,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }
  

  Future<List<Task>> readAllTask() async {
    final db = await instance.database;

    final orderBy = '${TaskFields.date} ASC';

    final result = await db.query(tableTasks, orderBy: orderBy);

    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future<int> taskLength() async {
    final db = await instance.database;
    var x = await db.rawQuery('''
        SELECT COUNT (*) from
        $tableTasks''');
    int count = Sqflite.firstIntValue(x)!;
    return count;
  }


  Future<List<Task>> readTodayTask() async {
    final db = await instance.database;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    final result = await db.query(
        tableTasks,
        columns: TaskFields.values,
        where: "${TaskFields.date} LIKE ?",
        whereArgs: ['%$formattedDate%']
    );

    return result.map((json) => Task.fromJson(json)).toList();
  }
  
  Future<int> update(Task task) async {
    final db = await instance.database;
    
    return db.update(tableTasks,
    task.toJson(),
    where: '${TaskFields.id} = ?',
    whereArgs: [task.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return db.delete(tableTasks,
        where: '${TaskFields.id} = ?',
        whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
