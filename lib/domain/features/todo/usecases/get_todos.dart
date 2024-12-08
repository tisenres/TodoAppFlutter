import 'package:injectable/injectable.dart';

import '../repositories/todo_repository.dart';
import '../entities/todo_entity.dart';

@injectable
class GetTodos {
  final TodoRepository repository;
  GetTodos(this.repository);

  Future<List<TodoEntity>> call() async {
    return repository.getTodos();
  }
}
