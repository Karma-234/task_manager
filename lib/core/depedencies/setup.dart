import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:task_manager/firebase_options.dart';

_setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    if (kDebugMode) {
      debugPrint('${event.level.name} ${event.time} ${event.message} ');
    }
  });
}

Future<void> setupDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
