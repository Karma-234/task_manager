import 'package:flutter/material.dart';

class UserWidget extends InheritedWidget {
  const UserWidget(
      {super.key,
      required super.child,
      required this.data,
      this.shouldNotify = false});
  final UserState data;
  final bool shouldNotify;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return shouldNotify;
  }
}

class User extends StatefulWidget {
  final Widget child;
  final String userName;
  final String password;
  const User({
    super.key,
    required this.child,
    this.password = '',
    this.userName = '',
  });

  static UserState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserWidget>()!.data;
  }

  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {
  String userName = '';
  String password = '';
  bool shouldNotify = false;

  setUserName(String entry) {
    setState(() {
      userName = entry;
    });
  }

  setPassword(String entry) {
    setState(() {
      password = entry;
    });
  }

  shouldNotifyListeners() {
    setState(() {
      shouldNotify = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserWidget(
      data: this,
      shouldNotify: shouldNotify,
      child: widget.child,
    );
  }
}
