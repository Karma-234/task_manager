import 'package:mobx/mobx.dart';

import '../core/models/response/todo_response.dart';
part 'fetch_todo.g.dart';

class FetchTodoState = AbstractFetchTodoState with _$FetchTodoState;

abstract class AbstractFetchTodoState with Store {
  @observable
  List<Todo> todos = [];

  @action
  setTodo(Map<String, dynamic>? data) {
    final getList = (data?['tasks'] ?? []) as List;
    todos = getList.map((e) => Todo.fromJson(e)).toList();
  }
}
