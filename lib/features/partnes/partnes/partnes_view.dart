import 'package:flutter/material.dart';

abstract class PartnesViewModelProtocol extends ChangeNotifier {
  int get length;
  bool get isLoading;

  void getAll();
  void didTap();
  String name(int index);
  String image(int index);
  String discount(int index);
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
