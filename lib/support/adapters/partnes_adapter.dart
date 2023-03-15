import 'package:hive/hive.dart';
import 'package:partners/models/partners.dart';

class PartnesHiveAdapter extends TypeAdapter<Partnes> {
  @override
  final typeId = 0;

  @override
  Partnes read(BinaryReader reader) {
    return Partnes(
      id: reader.readString(),
      image: reader.readString(),
      fantasyName: reader.readString(),
      discountAmount: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Partnes obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.image);
    writer.writeString(obj.fantasyName);
    writer.writeString(obj.discountAmount);
  }
}
