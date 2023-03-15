import 'package:flutter/material.dart';

import '../../../support/components/list_card.dart';

abstract class SearchViewModelProtocol extends ChangeNotifier {
  int get length;

  void copyWith();
  String name(int index);
  String image(int index);
  void change(String value);
  String discount(int index);
}

class SearchView extends StatelessWidget {
  final SearchViewModelProtocol viewModel;

  const SearchView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search partnes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: viewModel.change,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pesquisar parceiro',
              ),
            ),
          ),
          AnimatedBuilder(
            animation: viewModel,
            builder: (context, snapshot) {
              return Expanded(
                child: ListView.builder(
                  itemCount: viewModel.length,
                  itemBuilder: (_, index) {
                    return ListCard(
                      name: viewModel.name(index),
                      image: viewModel.image(index),
                      discount: viewModel.discount(index),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
