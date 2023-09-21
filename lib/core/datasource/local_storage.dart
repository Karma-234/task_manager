import 'package:hive_flutter/hive_flutter.dart';

class AppLocalStorage {
  static Future initFlutter() async {
    await Hive.initFlutter();
    Hive.openBox('task.manger');
  }

  Box? box;
  void addUser(String user) {
    box?.put('user', user);
  }

  String? getUser() => box?.get('user');
}
