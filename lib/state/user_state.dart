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
  final String? uid;
  final bool isLoading;
  const User(
      {super.key,
      required this.child,
      this.password = '',
      this.userName = '',
      this.uid,
      this.isLoading = false});

  static UserState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserWidget>()!.data;
  }

  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {
  String userName = '';
  String password = '';
  String? uid;
  bool shouldNotify = false;
  bool isLoading = false;

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

  setUid(String? entry) {
    setState(() {
      uid = entry;
    });
  }

  shouldNotifyListeners() {
    setState(() {
      shouldNotify = true;
    });
  }

  setLoading(bool entry) {
    setState(() {
      isLoading = entry;
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
