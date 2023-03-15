import 'package:hive/hive.dart';
import 'package:partners/models/partners.dart';
import 'package:partners/support/utils/constants.dart';

import '../../../support/utils/hive_configs.dart';
import 'favorites_view_controller.dart';

class FavoritesViewModel extends FavoritesProtocol {
  late Box _box;
  bool _isLoading = false;
  final List<Partnes> _partnes = [];

  @override
  bool get isLoading => _isLoading;

  @override
  int get length => _partnes.length;

  @override
  String key(int index) {
    return _partnes[index].id;
  }

  @override
  String name(int index) {
    return _partnes[index].fantasyName;
  }

  @override
  bool get isEmpty => _partnes.isEmpty;

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
  void getFavorites() async {
    _partnes.clear();
    _setLoading(true);
    HiveConfigs.start();
    _box = await Hive.openBox<Partnes>('partnes');
    final list = _box.values.cast<Partnes>();
    _partnes.addAll(list);

    //print(_partnes[0].fantasyName);
    print(list.length);

    _setLoading(false);
    notifyListeners();
  }

  @override
  void remorePartnes(int index) async {
    _box = await Hive.openBox<Partnes>('partnes');
    final partnes = _box.get(_partnes[index].id);
    _box.delete(partnes.id);

    _partnes.removeAt(index);

    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }
}
