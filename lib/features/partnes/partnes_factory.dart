import 'package:flutter/material.dart';
import 'package:partners/api/routes/get_partnes_routes.dart';
import 'package:partners/features/partnes/partnes/partnes_view_controller.dart';
import 'package:partners/features/partnes/partnes/partnes_view_model.dart';
import 'package:partners/features/partnes/use_cases/partnes_use_case.dart';

class PartnesFactory {
  static const String route = '/partnes';

  static StatefulWidget partnes() {
    final routes = GetPartnesRoutes();
    final useCase = PartnesUceCase(routes: routes);
    final viewModel = PartnesViewModel(useCase: useCase);

    return PartnesViewController(
      viewModel: viewModel,
      key: GlobalObjectKey(viewModel),
    );
  }
}
