import 'package:flutter/material.dart';
import 'package:my_todo_test/screens/export_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LandingScreen.id:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case DoneScreen.id:
        return MaterialPageRoute(
          builder: (_) => const DoneScreen(),
        );
      case SettingScreen.id:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case NewTaskScreen.id:
        return MaterialPageRoute(
          builder: (_) => const NewTaskScreen(),
        );
    }
    return null;
  }
}
