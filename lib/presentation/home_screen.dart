import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/depedencies/setup.dart';
import 'package:task_manager/core/services/storage/storage_service.dart';
import 'package:task_manager/core/utils/colors.dart';
import 'package:task_manager/state/fetch_todo.dart';
import 'package:task_manager/state/user_state.dart';

import '../components/add_task.dart';
import '../components/homw_app_bar.dart';
import '../components/todo_page_builder.dart';
import '../shared_widgets/app_snackbar.dart';
import '../shared_widgets/buttons/add_task.dart';
import 'package:mobx/mobx.dart' as mobx;

import '../shared_widgets/todo_information_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = User.of(context);
    final storageService = StorageService();
    final list = FetchTodoState();
    final getTodos =
        mobx.ObservableStream<DocumentSnapshot<Map<String, dynamic>>>(
            storageService.getTodo(uid: state.uid));
    getTodos.listen((value) {
      list.setTodo(value.data());
    });
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.p1,
      floatingActionButton: AddTaskButton(
        onPress: () {
          taskAdder(context, storageService, formKey);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeAppBar(
              state: state,
              onLogout: () => getTodos.close(),
            ),
            const Divider(
              color: Colors.grey,
            ),
            12.verticalSpace,
            Observer(
              builder: (context) {
                if (getTodos.hasError) {
                  return const TodoInformationWidget();
                }
                if (list.todos.isEmpty) {
                  return const TodoInformationWidget(
                    text: 'No task yet!',
                  );
                }
                return TodoPageBuilder(
                  list: list,
                  storageService: storageService,
                  state: state,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> taskAdder(BuildContext context, StorageService storageService,
      GlobalKey<FormState> formKey) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AddTaskBody(
        state: locator(),
        onSubmit: (v) {
          if (formKey.currentState?.validate() ?? false) {
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
          } else {
            return;
          }
        },
        formKey: formKey,
      ),
    );
  }
}
