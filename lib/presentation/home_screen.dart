import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/services/auth/auth_service.dart';
import 'package:task_manager/core/utils/colors.dart';
import 'package:task_manager/state/user_state.dart';

import '../components/add_task.dart';
import '../components/homw_app_bar.dart';
import '../shared_widgets/buttons/add_task.dart';
import '../shared_widgets/todo_card.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late final state = User.of(context);
    late final auth = AuthService();
    try {
      auth.signInAnonymously().then((resp) {
        debugPrint(resp.user?.uid);
      });
    } catch (e) {}
    return Scaffold(
      backgroundColor: AppColors.p1,
      floatingActionButton: AddTaskButton(
        onPress: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AddTaskBody(),
          );
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
            24.verticalSpace,
            const TodoCard()
          ],
        ),
      ),
    );
  }
}
