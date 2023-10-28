import 'package:flutter/material.dart';
import 'package:iam_app_recette/models/Recette.dart';

class ItemRecetteWidget extends StatelessWidget {
  final Recette recette;
  const ItemRecetteWidget({super.key, required this.recette});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                recette.image,
                fit: BoxFit.cover,
                width: 70,
                height: 90,
              ),
            ),
            title: Text(
              recette.nom,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(recette.description),
            trailing: IconButton(
                onPressed: () => {}, icon: const Icon(Icons.favorite_outline)),
          ),
        ),
        const Divider(height: 0)
      ],
    );
  }
}
