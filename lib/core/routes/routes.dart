import 'package:flutter/material.dart';

import '../../app/presentation/screens/home/home_screen.dart';
import '../../app/presentation/screens/surah_ayat/surah_ayat_screen.dart';

class Routes {
  static const String homeScreen = "/";
  static const String surahAyatScreen = "/surahAyatScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.surahAyatScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            var args = routeSettings.arguments as PassIntArguments;
            return SurahAyatScreen(
              surahNumber: args.id,
            );
          },
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text("مسار غير موجود"),
              ),
              body: const Center(
                child: Text(
                  "مسار غير موجود",
                ),
              ),
            ));
  }
}

class PassIntArguments {
  int id;

  PassIntArguments({
    required this.id,
  });
}
