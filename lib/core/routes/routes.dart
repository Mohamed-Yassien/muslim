import 'package:flutter/material.dart';

import '../../app/presentation/screens/home/home_screen.dart';

class Routes {
  static const String homeScreen = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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

class CmsPageArguments {
  String pageName;

  CmsPageArguments({
    required this.pageName,
  });
}

class PassIntArguments {
  int id;

  PassIntArguments({
    required this.id,
  });
}

class PassIntTwoArguments {
  int id1;
  int id2;

  PassIntTwoArguments({
    required this.id1,
    required this.id2,
  });
}
