import '../repositories/todo_repository.dart';
import '../entities/todo_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<void> call(TodoEntity todo) async {
    await repository.updateTodo(todo);
  }
}