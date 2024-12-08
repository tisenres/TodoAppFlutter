import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import '../dtos/todo_dto.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoDto>> getAllTodos();
  Future<void> insertTodo(TodoDto todo);
  Future<void> updateTodo(TodoDto todo);
}

@LazySingleton(as: TodoLocalDataSource)
class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final Database db;

  TodoLocalDataSourceImpl(this.db);

  @override
  Future<List<TodoDto>> getAllTodos() async {
    final results = await db.query('todos', orderBy: 'deadline ASC');
    return results.map((e) => TodoDto.fromMap(e)).toList();
  }

  @override
  Future<void> insertTodo(TodoDto todo) async {
    await db.insert('todos', todo.toMap());
  }

  @override
  Future<void> updateTodo(TodoDto todo) async {
    await db.update('todos', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }
}
