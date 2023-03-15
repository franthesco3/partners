import '../../../models/partners.dart';
import '../../../support/utils/localize.dart';
import '../../search/search_factory.dart';
import 'partnes_view.dart';
import 'package:flutter/material.dart';

abstract class PartnesProtocol extends PartnesViewModelProtocol {
  void Function()? onTapFavorite;
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
    widget.viewModel.onTapFavorite = () {
      final l10n = Localize.instance.l10n;

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
                Text(
                  l10n.wantAddFavorite,
                  style: const TextStyle(fontSize: 20),
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
                      child: Text(
                        l10n.addTitle,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        l10n.cancelTitle,
                        style: const TextStyle(color: Colors.red),
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
