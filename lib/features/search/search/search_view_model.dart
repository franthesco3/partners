import 'package:hive/hive.dart';
import 'package:partners/models/partners.dart';
import 'package:partners/features/search/search/search_view_controller.dart';
import 'package:partners/support/utils/constants.dart';

class SearchViewModel extends SearchProtocol {
  int _index = 0;
  late Box _box;
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
    const perc = '%';
    return _partnes[index].discountAmount + perc;
  }

  @override
  String image(int index) {
    return Constants.urlBaseImage + _partnes[index].image;
  }

  @override
  void addFavorite(int index) async {
    _index = index;
    final partnes = _partnes[index];

    onTapFavorite?.call();
    notifyListeners();
  }

  @override
  void savePartnes() async {
    final partnes = _partnes[_index];
    _box = await Hive.openBox<Partnes>('partnes');

    _box.put(partnes.id, partnes);
  }
}
