import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/depedencies/setup.dart';
import 'package:task_manager/core/models/response/todo_response.dart';
import 'package:task_manager/core/services/storage/storage_service.dart';
import 'package:task_manager/core/theme/text_styles.dart';
import 'package:task_manager/core/utils/colors.dart';
import 'package:task_manager/state/user_state.dart';

import '../components/add_task.dart';
import '../components/homw_app_bar.dart';
import '../shared_widgets/app_snackbar.dart';
import '../shared_widgets/buttons/add_task.dart';
import '../shared_widgets/todo_card.dart';
import 'package:mobx/mobx.dart' as mobx;

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = User.of(context);
    final storageService = StorageService();
    final getTodos =
        mobx.ObservableStream<DocumentSnapshot<Map<String, dynamic>>>(
            storageService.getTodo(uid: state.uid));

    return Scaffold(
      backgroundColor: AppColors.p1,
      floatingActionButton: AddTaskButton(
        onPress: () {
          taskAdder(context, storageService);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeAppBar(state: state),
            const Divider(
              color: Colors.grey,
            ),
            12.verticalSpace,
            Observer(
              builder: (context) {
                final list = TodoResponse(
                    todos: ((getTodos.value?.data()?['tasks'] ?? []) as List)
                        .map((e) => Todo.fromJson(e))
                        .toList());

                if (getTodos.hasError) {
                  return Center(
                    child: Text(
                      'Error getting tasks!',
                      style: AppTextstyles.large(),
                    ),
                  );
                }
                if (list.todos.isEmpty) {
                  return Center(
                    child: Text(
                      'No task yet!',
                      style: AppTextstyles.large(),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: list.todos.length,
                    separatorBuilder: (context, index) => 12.verticalSpace,
                    itemBuilder: (context, i) {
                      return TodoCard(
                        title: list.todos[i].title,
                        description: list.todos[i].description,
                        isDone: list.todos[i].done ?? false,
                        markDone: () => storageService.updateTodo(
                          payload: list,
                          uid: state.uid ?? '',
                          index: i,
                          onError: (e) => appSnackBar(context, tetx: e),
                        ),
                        delete: () => storageService.deleteTodo(
                          payload: list.todos[i],
                          uid: state.uid ?? '',
                          onError: (e) => appSnackBar(context, tetx: e),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> taskAdder(
      BuildContext context, StorageService storageService) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AddTaskBody(
        state: locator(),
        onSubmit: (v) {
          try {
            User.of(context).setLoading(true);
            storageService
                .addTodo(
              uid: User.of(context).uid ?? '',
              payload: v,
              onError: (e) => appSnackBar(context, tetx: e),
            )
                .then((value) {
              User.of(context).setLoading(false);
              context.popRoute();
              appSnackBar(context, tetx: 'Todo added successfully!');
            });
          } catch (e) {
            User.of(context).setLoading(false);
            appSnackBar(context, tetx: e.toString());
          }
        },
      ),
    );
  }
}
