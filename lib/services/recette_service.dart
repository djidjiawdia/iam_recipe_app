import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iam_app_recette/models/Recette.dart';

class RecetteService {
  final String collectionPath = 'recettes';
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<Recette> create(Recette recette) async {
    try {
      final document =
          await _store.collection(collectionPath).add(recette.toJson());
      recette.id = document.id;
      return recette;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Recette>> getData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _store.collection(collectionPath).get();
      return snapshot.docs.map((d) => Recette.fromJson(d)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
