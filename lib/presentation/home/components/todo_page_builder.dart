import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/storage/storage_service.dart';
import '../../../shared_widgets/app_snackbar.dart';
import '../../../shared_widgets/todo_card.dart';
import '../../../state/fetch_todo.dart';
import '../../../state/user_state.dart';

class TodoPageBuilder extends StatelessWidget {
  const TodoPageBuilder({
    super.key,
    required this.list,
    required this.storageService,
    required this.state,
  });

  final FetchTodoState list;
  final StorageService storageService;
  final UserState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: list.todos.length,
        separatorBuilder: (context, index) => 12.verticalSpace,
        itemBuilder: (context, i) {
          return TodoCard(
            title: list.todos[i].title,
            description: list.todos[i].description,
            isDone: list.todos[i].done ?? false,
            markDone: () {
              storageService.updateTodo(
                payload: list.todos,
                uid: state.uid ?? '',
                index: i,
                onError: (e) => appSnackBar(context, tetx: e),
              );
              appSnackBar(context, tetx: 'Task updated successfully!');
            },
            delete: () {
              storageService.deleteTodo(
                payload: list.todos[i],
                uid: state.uid ?? '',
                onError: (e) => appSnackBar(context, tetx: e),
              );
              appSnackBar(context, tetx: 'Task deleted successfully!');
            },
          );
        },
      ),
    );
  }
}
