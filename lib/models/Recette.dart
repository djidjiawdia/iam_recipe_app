import 'package:iam_app_recette/models/ingredient.dart';

class Recette {
  final String? id;
  final String nom;
  final String description;
  final String image;
  final List<Ingredient> ingredients;

  Recette({
    this.id,
    required this.nom,
    required this.description,
    required this.image,
    required this.ingredients,
  });
}
