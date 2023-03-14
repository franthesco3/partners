import 'package:flutter/material.dart';

import '../../features/partnes/partnes_factory.dart';

class MobileRoutes {
  static const String initialRoute = PartnesFactory.route;

  static Map<String, WidgetBuilder> routes = {
    PartnesFactory.route: (context) {
      return PartnesFactory.partnes();
    }
  };
}
