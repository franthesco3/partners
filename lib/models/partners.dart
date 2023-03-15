class Partnes {
  final String id;
  final String image;
  final String fantasyName;
  final String discountAmount;

  Partnes({
    required this.id,
    required this.image,
    required this.fantasyName,
    required this.discountAmount,
  });

  Partnes.fromMap(Map<String, dynamic> map)
      : image = map['cover'],
        id = map['id'].toString(),
        fantasyName = map['fantasyName'],
        discountAmount = map['discountAmount'].toString();
}
