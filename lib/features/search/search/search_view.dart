import 'package:flutter/material.dart';

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
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(18),
                          leading: SizedBox(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(viewModel.image(index)),
                            ),
                          ),
                          title: Text(
                            viewModel.name(index),
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: SizedBox(
                            height: 40,
                            width: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  viewModel.discount(index),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
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
