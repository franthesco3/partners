import 'package:flutter/material.dart';

import '../../../support/components/list_card.dart';

abstract class FavoritesViewModelProtocol extends ChangeNotifier {
  int get length;
  bool get isEmpty;
  bool get isLoading;

  void getFavorites();
  String key(int index);
  String name(int index);
  String image(int index);
  String discount(int index);
  void remorePartnes(int index);
}

class FavoritesView extends StatelessWidget {
  final FavoritesViewModelProtocol viewModel;

  const FavoritesView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.isEmpty) {
            return const Center(child: Text('Lista de favoritos Vazia'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Lista de parceiros firmados:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.length,
                  itemBuilder: (_, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Deletar parceiro',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 60),
                            Icon(Icons.delete, size: 40, color: Colors.white)
                          ],
                        ),
                      ),
                      onDismissed: (dismissible) {
                        viewModel.remorePartnes(index);
                      },
                      child: ListCard(
                        onTap: () {
                          viewModel.remorePartnes(index);
                        },
                        isFavorite: true,
                        name: viewModel.name(index),
                        image: viewModel.image(index),
                        // discount: viewModel.discount(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
