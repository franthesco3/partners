import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../support/utils/constants.dart';
import '../../../support/utils/localize.dart';

abstract class SplashScreenViewModelProtocol {
  void goToHome();
}

class SplashScreenView extends StatelessWidget {
  final SplashScreenViewModelProtocol viewModel;

  const SplashScreenView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.welcomeTitle,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Lottie.asset(Constants.partnes),
          Text(
            l10n.bePartnesCompany,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
