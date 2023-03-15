import '../../models/partners.dart';
import 'package:flutter/material.dart';
import '../../features/favorites/favorites_factory.dart';
import '../../features/search/search_factory.dart';
import '../../features/partnes/partnes_factory.dart';
import 'package:partners/features/home/home_factory.dart';
import 'package:partners/features/splash_screen/splash_screen_factory.dart';

class MobileRoutes {
  static const String initialRoute = SplashScreenFactory.route;

  static Map<String, WidgetBuilder> routes = {
    PartnesFactory.route: (_) {
      return PartnesFactory.partnes();
    },
    SearchFactory.route: (context) {
      final partnes =
          ModalRoute.of(context)?.settings.arguments as List<Partnes>;
      return SearchFactory.search(partnes);
    },
    SplashScreenFactory.route: (context) {
      return SplashScreenFactory.splashScreen();
    },
    HomeFactory.route: (_) {
      return HomeFactory.home();
    },
    FavoritesFactory.route: (_) {
      return FavoritesFactory.favorites();
    }
  };
}
