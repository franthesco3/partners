import 'package:flutter/material.dart';
import '../../../support/components/list_card.dart';

abstract class PartnesViewModelProtocol extends ChangeNotifier {
  int get length;
  bool get isLoading;

  void getAll();
  void didTap();
  void savePartnes();
  String name(int index);
  String image(int index);
  String discount(int index);
  void addFavorite(int index);
}

class PartnesView extends StatelessWidget {
  final PartnesViewModelProtocol viewModel;

  const PartnesView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Veja a lista de parceiros disponíveis:',
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
                    return InkWell(
                      onTap: () => viewModel.addFavorite(index),
                      child: ListCard(
                        name: viewModel.name(index),
                        image: viewModel.image(index),
                        discount: viewModel.discount(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.didTap,
        child: const Icon(Icons.search),
      ),
    );
  }
}
