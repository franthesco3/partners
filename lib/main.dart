import 'package:flutter/material.dart';

import 'support/utils/mobile_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: MobileRoutes.routes,
      initialRoute: MobileRoutes.initialRoute,
    );
  }
}