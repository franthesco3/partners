import 'package:flutter/material.dart';
import 'package:partners/features/partnes/partnes_factory.dart';
import 'package:partners/support/utils/localize.dart';

import '../../favorites/favorites_factory.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  int get index;

  void setIndex(int index);
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    List<Widget> contents = [
      PartnesFactory.partnes(),
      FavoritesFactory.favorites(),
    ];

    return AnimatedBuilder(
        animation: viewModel,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(l10n.appTitle),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: l10n.homeTitle,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite),
                  label: l10n.favoritesTitle,
                ),
              ],
              selectedItemColor: Colors.white,
              currentIndex: viewModel.index,
              onTap: viewModel.setIndex,
            ),
            body: contents.elementAt(viewModel.index),
          );
        });
  }
}
