import 'package:flutter/material.dart';

import '../../features/partnes/partnes_factory.dart';
import '../../features/search/search_factory.dart';
import '../models/partners.dart';

class MobileRoutes {
  static const String initialRoute = PartnesFactory.route;

  static Map<String, WidgetBuilder> routes = {
    PartnesFactory.route: (_) {
      return PartnesFactory.partnes();
    },
    SearchFactory.route: (context) {
      final partnes =
          ModalRoute.of(context)?.settings.arguments as List<Partnes>;
      return SearchFactory.search(partnes);
    }
  };
}
