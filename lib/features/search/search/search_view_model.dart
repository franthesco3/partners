import 'package:partners/support/models/partners.dart';
import 'package:partners/features/search/search/search_view_controller.dart';
import 'package:partners/support/utils/constants.dart';

class SearchViewModel extends SearchProtocol {
  List<Partnes> partnes;
  final List<Partnes> _partnes = [];
  SearchViewModel({required this.partnes});

  @override
  int get length => partnes.length;

  @override
  String name(int index) {
    return partnes[index].fantasyName;
  }

  @override
  void change(String value) {
    List<Partnes> result = [];
    if (value.isEmpty) {
      partnes = _partnes;
      notifyListeners();
      return;
    } else {
      result = filter(_partnes, value);
    }
    partnes = result;
    notifyListeners();
  }

  @override
  void copyWith() {
    _partnes.addAll(partnes);
  }

  List<Partnes> filter(List<Partnes> partnes, String value) {
    return partnes
        .where(
          (e) => e.fantasyName
              .toLowerCase()
              .toLowerCase()
              .contains(value.toLowerCase()),
        )
        .toList();
  }

  @override
  String discount(int index) {
    return _partnes[index].discountAmount;
  }

  @override
  String image(int index) {
    return Constants.urlBaseImage + _partnes[index].image;
  }
}
