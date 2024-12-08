import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/features/todo/usecases/add_todo.dart';
import '../../../../domain/features/todo/usecases/update_todo.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../../../../domain/features/todo/usecases/get_todos.dart';


@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;

  TodoBloc({
    required this.getTodos,
    required this.addTodo,
    required this.updateTodo,
  }) : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddNewTodo>(_onAddTodo);
    on<UpdateExistingTodo>(_onUpdateTodo);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodosLoading());
    try {
      final todosList = await getTodos();
      emit(TodosLoaded(todos: todosList));
    } catch (_) {
      emit(TodosError());
    }
  }

  Future<void> _onAddTodo(AddNewTodo event, Emitter<TodoState> emit) async {
    if (state is TodosLoaded) {
      await addTodo(event.todo);
      add(LoadTodos());
    }
  }

  Future<void> _onUpdateTodo(UpdateExistingTodo event, Emitter<TodoState> emit) async {
    if (state is TodosLoaded) {
      await updateTodo(event.todo);
      add(LoadTodos());
    }
  }
}
