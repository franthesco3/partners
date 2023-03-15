import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'support/utils/mobile_routes.dart';
import 'support/adapters/partnes_adapter.dart';
import 'package:partners/support/utils/localize.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:partners/support/utils/hive_configs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfigs.start();
  Hive.registerAdapter(PartnesHiveAdapter());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: MobileRoutes.routes,
        initialRoute: MobileRoutes.initialRoute,
        supportedLocales: Localization.supportedLocales,
        localizationsDelegates: Localization.localizationsDelegates,
        onGenerateTitle: (context) => Localize.instance.of(context).appTitle);
  }
}
