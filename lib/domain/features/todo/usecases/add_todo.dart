import '../repositories/todo_repository.dart';
import '../entities/todo_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<void> call(TodoEntity todo) async {
    await repository.addTodo(todo);
  }
}