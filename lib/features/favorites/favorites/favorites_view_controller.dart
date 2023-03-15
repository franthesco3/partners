import 'package:flutter/material.dart';

import 'favorites_view.dart';

abstract class FavoritesProtocol extends FavoritesViewModelProtocol {}

class FavoritesViewController extends StatefulWidget {
  final FavoritesProtocol viewModel;

  const FavoritesViewController({super.key, required this.viewModel});

  @override
  State<FavoritesViewController> createState() =>
      _FavoritesViewControllerState();
}

class _FavoritesViewControllerState extends State<FavoritesViewController> {
  @override
  void initState() {
    widget.viewModel.getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FavoritesView(viewModel: widget.viewModel);
  }
}
