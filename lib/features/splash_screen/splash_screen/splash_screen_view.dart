import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../support/utils/constants.dart';

abstract class SplashScreenViewModelProtocol {
  void goToHome();
}

class SplashScreenView extends StatelessWidget {
  final SplashScreenViewModelProtocol viewModel;

  const SplashScreenView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Constants.partnes),
          const Text(
            'Seja um parceiro comercial!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Hind',
            ),
          )
        ],
      ),
    );
  }
}
