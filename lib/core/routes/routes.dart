import 'package:flutter/material.dart';
import 'package:muslin/app/domain/models/surah/surah_model.dart';

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
            var args = routeSettings.arguments as PassModel;
            return SurahAyatScreen(
              surahData: args.surahData,
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

class PassModel {
  final SurahData surahData;

  PassModel({
    required this.surahData,
  });
}
