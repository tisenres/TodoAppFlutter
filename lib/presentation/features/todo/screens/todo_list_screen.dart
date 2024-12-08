import 'package:flutter/material.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import 'add_todo_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('My Todos'),
          ),
          body: state is TodosLoading
              ? Center(child: CircularProgressIndicator())
              : state is TodosLoaded
              ? ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(
                    'Deadline: ${todo.deadline}\nImportance: ${todo.importance}'),
              );
            },
          )
              : Center(child: Text('Error Loading Todos')),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final newTodo = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddTodoScreen()),
              );
              if (newTodo != null) {
                context.read<TodoBloc>().add(AddNewTodo(newTodo));
              }
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

