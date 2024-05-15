import '../packages/index.dart';

/// The route configuration.
/// state.pathParameters['userId']
/// state.uri.queryParameters['filter']
///
///
///
abstract class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String introSlider = 'intro_slider';
  static const String home = 'home';
  static const String addition = 'addition';
  static const String newTask = 'new_task';
  static const String calendar = 'calendar';
  static const String settings = 'settings';
}

extension AppNavigator on BuildContext {
  void navigateHome() {
    pushReplacementNamed(AppRouter.home, queryParameters: {});
  }

  void navigateIntroSlider() {
    pushReplacementNamed(AppRouter.introSlider, queryParameters: {});
  }

  void navigateAddition() {
    pushReplacementNamed(AppRouter.addition, queryParameters: {});
  }

  void navigateNewTask() {
    pushReplacementNamed(AppRouter.newTask, queryParameters: {});
  }

  void navigateCalender() {
    pushReplacementNamed(AppRouter.calendar, queryParameters: {});
  }

  void navigateSettings() {
    pushReplacementNamed(AppRouter.settings, queryParameters: {});
  }
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  observers: [YDToast.obs()],
  routes: <RouteBase>[
    GoRoute(
      name: AppRouter.splash,
      path: AppRouter.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const Placeholder();
      },
      routes: <RouteBase>[

      ],
    ),
  ],
);