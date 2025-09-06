import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model/task_model.dart';

class DBHelper {
  static Database? _database;
  static String tableName = "task";

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "todo.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE task (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    taskTitle TEXT,
    taskDescription TEXT,
    time TEXT,
    date TEXT,
    taskPriority INTEGER
    )
    ''');
  }

  Future<int> insertTask(Task task) async {
    final db = await initDb();
    return await db.insert(tableName, task.toMap());
  }

  Future<List<Task>> queryAllTask() async {
    final db = await initDb();
    final result = await db.query(tableName, orderBy: "id");

    return result.map((result) => Task.fromMap(result)).toList();
  }

  Future<List<Task>> getTaskByPriority(int priority) async {
    final db = await initDb();
    final result = await db.query(
      tableName,
      where: "taskPriority = ?",
      whereArgs: [priority],
    );

    return result.map((result) => Task.fromMap(result)).toList();
  }

  Future<int> updateTask(int id, Task task) async {
    final db = await initDb();
    return await db.update(
      tableName,
      task.toMap(),
      where: "id = ?",
      whereArgs: [task.id],
    );
  }

  Future<int> removeTask(int id) async {
    final db = await initDb();
    return await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }

  Future<void> initializeTask() async {
    List<Task> taskToAdd = [
      Task(
        taskTitle: "Jogging",
        taskDescription: "Jalan jalan doang, mau kasih desc apalagi emang?",
        date: "20/04/2026",
        time: "05.00",
        taskPriority: 1,
      ),
      Task(
        taskTitle: "Kerjain PR",
        taskDescription: "PR dari pak suryadi yang kumisnya tebel itu",
        date: "26/04/2026",
        time: "19.00",
        taskPriority: 2,
      ),
      Task(
        taskTitle: "Ke SC",
        taskDescription: "Ngurus berkas buat motor",
        date: "12/04/2026",
        time: "09.00",
        taskPriority: 3,
      ),
    ];

    for (Task task in taskToAdd) {
      await insertTask(task);
    }
  }
}
