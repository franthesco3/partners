import 'package:partners/features/partnes/partnes/partnes_view_controller.dart';
import 'package:partners/support/models/partners.dart';

import '../../../support/utils/constants.dart';
import '../use_cases/partnes_use_case.dart';

class PartnesViewModel extends PartnesProtocol {
  bool _isLoading = false;
  final List<Partnes> _partnes = [];
  final PartnesUseCaseProtocol useCase;

  PartnesViewModel({required this.useCase});

  @override
  int get length => _partnes.length;

  @override
  bool get isLoading => _isLoading;

  @override
  void getAll() {
    setLoading(true);
    useCase.execute(
      success: (partnes) {
        _partnes.addAll(partnes);

        _partnes.sort((Partnes p1, Partnes p2) =>
            p1.fantasyName.trim().compareTo(p2.fantasyName.trim()));

        setLoading(false);
      },
      failure: (error) {
        setLoading(false);
        print(error);
      },
    );
  }

  @override
  void didTap() {
    goToScrenn?.call(_partnes);
  }

  @override
  String name(int index) {
    return _partnes[index].fantasyName;
  }

  @override
  String image(int index) {
    return Constants.urlBaseImage + _partnes[index].image;
  }

  @override
  String discount(int index) {
    const String perc = '%';
    return _partnes[index].discountAmount + perc;
  }

  void setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }
}
