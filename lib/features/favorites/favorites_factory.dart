import 'package:flutter/material.dart';
import 'package:partners/features/favorites/favorites/favorites_view_controller.dart';
import 'package:partners/features/favorites/favorites/favorites_view_model.dart';

class FavoritesFactory {
  static const String route = '/favorites';

  static StatefulWidget favorites() {
    final viewModel = FavoritesViewModel();

    return FavoritesViewController(viewModel: viewModel);
  }
}
