import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model/task_model.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._instance();
  static Database? _database;

  DBHelper._instance();

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
    id INTEGER PRIMARY KEY,
    task_title TEXT,
    task_desc TEXT,
    time TEXT,
    date TEXT,
    priority INTEGER
    )
    ''');
  }

  Future<int> insertTask(Task task) async {
    Database db = await instance.db;
    return await db.insert("task", task.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllTask() async {
    Database db = await instance.db;
    return await db.query("task");
  }

  Future<int> updateTask(Task task) async {
    Database db = await instance.db;
    return await db.update(
        "task", task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }

  Future<int> removeTask(int id) async {
    Database db = await instance.db;
    return await db.delete("task", where: "id = ?", whereArgs: [id]);
  }

  Future<void> inititializeTask() async {
    List<Task> taskToAdd = [
      Task(taskTitle: "Jogging",
          taskDescription: "Jalan jalan doang, mau kasih desc apalagi emang?",
          date: "20/04/2026",
          time: "05.00",
          taskPriority: 1),
      Task(taskTitle: "Kerjain PR",
          taskDescription: "PR dari pak suryadi yang kumisnya tebel itu",
          date: "26/04/2026",
          time: "19.00",
          taskPriority: 2),
      Task(taskTitle: "Jogging",
          taskDescription: "Ngurus berkas buat motor",
          date: "12/04/2026",
          time: "09.00",
          taskPriority: 3)
    ];

    for (Task task in taskToAdd) {
      await insertTask(task);
    }
  }
}