import 'package:flutter/material.dart';

import '../../../support/components/list_card.dart';
import '../../../support/utils/localize.dart';

abstract class SearchViewModelProtocol extends ChangeNotifier {
  int get length;

  void copyWith();
  void savePartnes();
  String name(int index);
  String image(int index);
  void change(String value);
  String discount(int index);
  void addFavorite(int index);
}

class SearchView extends StatelessWidget {
  final SearchViewModelProtocol viewModel;

  const SearchView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.searchTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: viewModel.change,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: l10n.searchPartnesLabel,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
