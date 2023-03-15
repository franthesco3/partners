import 'package:flutter/material.dart';

import 'search_view.dart';

abstract class SearchProtocol extends SearchViewModelProtocol {
  void Function()? onTapFavorite;
}

class SearchViewController extends StatefulWidget {
  final SearchProtocol viewModel;

  const SearchViewController({super.key, required this.viewModel});

  @override
  State<SearchViewController> createState() => _SearchViewControllerState();
}

class _SearchViewControllerState extends State<SearchViewController> {
  @override
  void initState() {
    _bind();
    widget.viewModel.copyWith();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapFavorite = () {
      showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 150,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Deseja adicionar como favorito ?',
                  style: TextStyle(fontSize: 20),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        widget.viewModel.savePartnes();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Adicionar',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      );
    };
  }
}
