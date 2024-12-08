import 'package:injectable/injectable.dart';
import '../../../../domain/features/todo/entities/todo_entity.dart';
import '../../../../domain/features/todo/repositories/todo_repository.dart';
import '../datasources/todo_local_data_source.dart';
import '../dtos/todo_dto.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<List<TodoEntity>> getTodos() => localDataSource.getAllTodos();

  @override
  Future<void> addTodo(TodoEntity todo) => localDataSource.insertTodo(TodoDto(
    title: todo.title,
    description: todo.description,
    deadline: todo.deadline,
    importance: todo.importance,
  ));

  @override
  Future<void> updateTodo(TodoEntity todo) => localDataSource.updateTodo(TodoDto(
    id: todo.id,
    title: todo.title,
    description: todo.description,
    deadline: todo.deadline,
    importance: todo.importance,
  ));
}