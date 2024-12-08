import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';
import 'presentation/features/todo/bloc/todo_bloc.dart';
import 'presentation/features/todo/bloc/todo_event.dart';
import 'presentation/features/todo/screens/todo_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the TodoBloc from the service locator
    final todoBloc = sl<TodoBloc>()..add(LoadTodos());

    return BlocProvider.value(
      value: todoBloc,
      child: MaterialApp(
        title: 'Animated Todo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: Colors.deepPurple,
        ),
        home: TodoListScreen(),
      ),
    );
  }
}