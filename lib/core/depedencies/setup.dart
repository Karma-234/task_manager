import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:task_manager/core/datasource/local_storage.dart';
import 'package:task_manager/firebase_options.dart';
import 'package:task_manager/state/todo_state.dart';

_setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    if (kDebugMode) {
      debugPrint('${event.level.name} ${event.time} ${event.message} ');
    }
  });
}

final locator = GetIt.instance;
Future<void> setupDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppLocalStorage.initFlutter();
  locator.registerLazySingleton(() => TodoState());
}
