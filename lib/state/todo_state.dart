import 'package:mobx/mobx.dart';
part 'todo_state.g.dart';

class TodoState = AbstractTodoState with _$TodoState;

abstract class AbstractTodoState with Store {
  @observable
  String? title;
  @observable
  String? description;

  @action
  setTitle(String entry) => title = entry;

  @action
  setDescription(String entry) => description = entry;
}
