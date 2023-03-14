import '../../../support/models/partners.dart';
import '../../search/search_factory.dart';
import 'partnes_view.dart';
import 'package:flutter/material.dart';

abstract class PartnesProtocol extends PartnesViewModelProtocol {
  void Function(List<Partnes> partnes)? goToScrenn;
}

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
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PartnesView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.goToScrenn = (partnes) {
      Navigator.pushNamed(context, SearchFactory.route, arguments: partnes);
    };
  }
}
