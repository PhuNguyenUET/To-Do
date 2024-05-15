import 'package:flutter/foundation.dart';

import 'firebase_options.dart';
import 'init/index.dart';
import 'packages/index.dart';

void main() async {
  await _initDependencies();
  runApp(const MainApplication());
}

Future<void> _initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Get secret key
  final result = await FirebaseFirestore.instance
      .collection('config')
      .doc('config-app')
      .get();

  final data = result.data() as Map<String, dynamic>;
  Config.secretKey = data['secret'];

  await _initDataSource();
}

Future<void> _initDataSource() async {
  sl.registerLazySingleton<AppEvent>(() => AppEvent.instance());
  sl.registerSingleton(await SharedPreferences.getInstance());
  sl.registerSingleton<Local>(Repository.local);

  final Repository repository = await Repository.createRepository(
    appEvent: sl.get<AppEvent>(),
    local: sl.get<Local>(),
  );

  sl.registerSingleton<Repository>(repository);
}
