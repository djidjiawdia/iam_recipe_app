import 'package:cloud_firestore/cloud_firestore.dart';

class Recette {
  String? id;
  String nom;
  String description;
  String image;
  List<String>? ingredients;

  Recette({
    this.id,
    required this.nom,
    required this.description,
    required this.image,
    this.ingredients,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'nom': nom,
        'description': description,
        'image': image,
        'ingredients': ingredients,
      };

  factory Recette.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Recette(
        id: doc.id,
        nom: doc.data()!['nom'] as String,
        description: doc.data()!['description'] as String,
        image: doc.data()!['image'] as String,
        // ingredients: doc.data()!['ingredients'] as List<String>,
      );

  // factory Recettes.fromJson(Map<String, dynamic> json)
}
