// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sqflite/sqflite.dart' as _i779;
import 'package:test_flutter/data/features/todo/datasources/todo_local_data_source.dart'
    as _i864;
import 'package:test_flutter/data/features/todo/repositories/todo_repository_impl.dart'
    as _i137;
import 'package:test_flutter/di/app_module.dart' as _i562;
import 'package:test_flutter/domain/features/todo/repositories/todo_repository.dart'
    as _i192;
import 'package:test_flutter/domain/features/todo/usecases/add_todo.dart'
    as _i592;
import 'package:test_flutter/domain/features/todo/usecases/get_todos.dart'
    as _i692;
import 'package:test_flutter/domain/features/todo/usecases/update_todo.dart'
    as _i186;
import 'package:test_flutter/presentation/features/todo/bloc/todo_bloc.dart'
    as _i110;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i779.Database>(
      () => appModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i864.TodoLocalDataSource>(
        () => _i864.TodoLocalDataSourceImpl(gh<_i779.Database>()));
    gh.lazySingleton<_i192.TodoRepository>(() => _i137.TodoRepositoryImpl(
        localDataSource: gh<_i864.TodoLocalDataSource>()));
    gh.factory<_i592.AddTodo>(() => _i592.AddTodo(gh<_i192.TodoRepository>()));
    gh.factory<_i186.UpdateTodo>(
        () => _i186.UpdateTodo(gh<_i192.TodoRepository>()));
    gh.factory<_i692.GetTodos>(
        () => _i692.GetTodos(gh<_i192.TodoRepository>()));
    gh.factory<_i110.TodoBloc>(() => _i110.TodoBloc(
          getTodos: gh<_i692.GetTodos>(),
          addTodo: gh<_i592.AddTodo>(),
          updateTodo: gh<_i186.UpdateTodo>(),
        ));
    return this;
  }
}

class _$AppModule extends _i562.AppModule {}
