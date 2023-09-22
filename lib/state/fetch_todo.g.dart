// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_todo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FetchTodoState on AbstractFetchTodoState, Store {
  late final _$todosAtom =
      Atom(name: 'AbstractFetchTodoState.todos', context: context);

  @override
  List<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$AbstractFetchTodoStateActionController =
      ActionController(name: 'AbstractFetchTodoState', context: context);

  @override
  dynamic setTodo(Map<String, dynamic>? data) {
    final _$actionInfo = _$AbstractFetchTodoStateActionController.startAction(
        name: 'AbstractFetchTodoState.setTodo');
    try {
      return super.setTodo(data);
    } finally {
      _$AbstractFetchTodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos}
    ''';
  }
}
