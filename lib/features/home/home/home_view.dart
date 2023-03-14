import 'package:flutter/material.dart';
import 'package:partners/features/partnes/partnes_factory.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  int get index;

  void setIndex(int index);
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [PartnesFactory.partnes()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partnes'),
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: viewModel,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              backgroundColor: Colors.blue,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
              ],
              selectedItemColor: Colors.white,
              currentIndex: viewModel.index,
              onTap: viewModel.setIndex,
            );
          }),
      body: contents.elementAt(viewModel.index),
    );
  }
}
