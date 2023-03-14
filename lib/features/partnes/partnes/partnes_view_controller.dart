import 'partnes_view.dart';
import 'package:flutter/material.dart';

abstract class PartnesProtocol extends PartnesViewModelProtocol {}

class PartnesViewController extends StatefulWidget {
  final PartnesProtocol viewModel;

  const PartnesViewController({super.key, required this.viewModel});

  @override
  State<PartnesViewController> createState() => _PartnesViewControllerState();
}

class _PartnesViewControllerState extends State<PartnesViewController> {
  @override
  void initState() {
    widget.viewModel.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PartnesView(viewModel: widget.viewModel);
  }
}
