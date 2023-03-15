import 'package:flutter/material.dart';
import 'package:partners/features/splash_screen/splash_screen/splash_screen_view_controller.dart';
import 'package:partners/features/splash_screen/splash_screen/splash_screen_view_model.dart';

class SplashScreenFactory {
  static const String route = '/splash_screen';

  static StatefulWidget splashScreen() {
    final viewModel = SplashScreenViewModel();

    return SplashScreenViewController(viewModel: viewModel);
  }
}
