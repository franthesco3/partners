import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  bool? isFavorite;
  final String name;
  final String image;
  String? discount;
  void Function()? onTap;

  ListCard(
      {super.key,
      this.onTap,
      required this.name,
      required this.image,
      this.isFavorite = false,
      this.discount});

  Widget get trailing {
    if (isFavorite == true) {
      return InkWell(
          onTap: onTap,
          child: const Icon(Icons.close, color: Colors.red, size: 30));
    }

    return const Icon(Icons.arrow_downward, color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(18),
          leading: SizedBox(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: SizedBox(
            height: 40,
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  discount ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                trailing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
