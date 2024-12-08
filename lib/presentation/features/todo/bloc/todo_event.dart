import 'package:equatable/equatable.dart';
import '../../../../domain/features/todo/entities/todo_entity.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}
class AddNewTodo extends TodoEvent {
  final TodoEntity todo;
  AddNewTodo(this.todo);
  @override
  List<Object?> get props => [todo];
}
class UpdateExistingTodo extends TodoEvent {
  final TodoEntity todo;
  UpdateExistingTodo(this.todo);
  @override
  List<Object?> get props => [todo];
}
