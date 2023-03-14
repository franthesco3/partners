import 'package:flutter/material.dart';

import 'search_view.dart';

abstract class SearchProtocol extends SearchViewModelProtocol {}

class SearchViewController extends StatefulWidget {
  final SearchProtocol viewModel;

  const SearchViewController({super.key, required this.viewModel});

  @override
  State<SearchViewController> createState() => _SearchViewControllerState();
}

class _SearchViewControllerState extends State<SearchViewController> {
  @override
  void initState() {
    widget.viewModel.copyWith();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchView(viewModel: widget.viewModel);
  }
}
