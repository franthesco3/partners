import 'package:flutter/material.dart';
import 'package:partners/features/search/search/search_view_controller.dart';
import 'package:partners/features/search/search/search_view_model.dart';
import '../../models/partners.dart';

class SearchFactory {
  static const String route = '/search';

  static StatefulWidget search(List<Partnes> partnes) {
    final viewModel = SearchViewModel(partnes: partnes);

    return SearchViewController(
      viewModel: viewModel,
      key: GlobalObjectKey(viewModel),
    );
  }
}
