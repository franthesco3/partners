import 'package:flutter/material.dart';
import 'package:partners/features/home/home_factory.dart';

import '../../partnes/partnes_factory.dart';
import 'splash_screen_view.dart';

abstract class SplashScreenProtocol extends SplashScreenViewModelProtocol {
  void Function()? nextToScreen;
}

class SplashScreenViewController extends StatefulWidget {
  final SplashScreenProtocol viewModel;

  const SplashScreenViewController({super.key, required this.viewModel});

  @override
  State<SplashScreenViewController> createState() =>
      _SplashScreenViewControllerState();
}

class _SplashScreenViewControllerState
    extends State<SplashScreenViewController> {
  @override
  void initState() {
    _bind();
    widget.viewModel.goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.nextToScreen = () {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeFactory.route, (route) => false);
      });
    };
  }
}
