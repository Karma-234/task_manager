import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/core/depedencies/setup.dart';
import 'package:task_manager/state/user_state.dart';

void main() async {
  await setupDependencies();
  runApp(const User(child: MainApp()));
}
