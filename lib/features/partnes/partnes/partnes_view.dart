import 'package:flutter/material.dart';

abstract class PartnesViewModelProtocol extends ChangeNotifier {
  int get length;
  bool get isLoading;

  void getAll();
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
      appBar: AppBar(
        title: const Text('Partnes'),
      ),
      body: AnimatedBuilder(
          animation: viewModel,
          builder: (_, __) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: viewModel.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(18),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(viewModel.image(index)),
                      ),
                      title: Text(viewModel.name(index)),
                      trailing: SizedBox(
                        height: 60,
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(viewModel.discount(index)),
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
            );
          }),
    );
  }
}
