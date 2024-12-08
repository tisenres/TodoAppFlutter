import 'package:equatable/equatable.dart';
import '../../../../domain/features/todo/entities/todo_entity.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodosLoading extends TodoState {}
class TodosLoaded extends TodoState {
  final List<TodoEntity> todos;
  TodosLoaded({required this.todos});
  @override
  List<Object?> get props => [todos];
}
class TodosError extends TodoState {}
