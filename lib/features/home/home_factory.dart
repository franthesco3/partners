import 'package:flutter/material.dart';
import 'package:partners/features/home/home/home_view_controller.dart';
import 'package:partners/features/home/home/home_view_model.dart';

class HomeFactory {
  static const String route = '/home';

  static StatefulWidget home() {
    final viewModel = HomeViewModel();

    return HomeViewController(viewModel: viewModel);
  }
}
