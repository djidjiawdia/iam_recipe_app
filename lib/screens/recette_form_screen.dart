import 'package:flutter/material.dart';
import 'package:iam_app_recette/models/Recette.dart';
import 'package:iam_app_recette/services/recette_service.dart';
import 'package:iam_app_recette/widgets/dialog_box_widget.dart';
import 'package:iam_app_recette/widgets/form_container_widget.dart';

class RecetteFormScreen extends StatefulWidget {
  const RecetteFormScreen({super.key});

  @override
  State<RecetteFormScreen> createState() => _RecetteFormScreenState();
}

class _RecetteFormScreenState extends State<RecetteFormScreen> {
  final RecetteService _recetteService = RecetteService();
  List<String> ingredients = [];
  bool _loading = false;

  final TextEditingController _ingredientController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une recettte')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: ListView(
          children: [
            FormContainerWidget(
              controller: _nomController,
              hintText: 'Nom de la recette',
            ),
            const SizedBox(height: 20),
            FormContainerWidget(
              controller: _descriptionController,
              maxLines: 5,
              hintText: 'Description',
            ),
            const SizedBox(height: 20),
            FormContainerWidget(
              controller: _imageController,
              hintText: "Lien de l'image",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Ingrédients",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.grey[700]),
                ),
                IconButton(
                    onPressed: () => ajouterIngredient(),
                    icon: const Icon(Icons.add))
              ],
            ),
            const SizedBox(height: 20),
            Wrap(spacing: 6, children: chipList()),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: ajouterRecette,
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber),
                child: Center(
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Enregistrer',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void ajouterRecette() {
    String nom = _nomController.text;
    String description = _descriptionController.text;
    String image = _imageController.text;

    setState(() {
      _loading = true;
    });

    Future<Recette> recette = _recetteService
        .create(Recette(nom: nom, description: description, image: image));

    if (recette != null) {
      Navigator.of(context).pop();
    }

    setState(() {
      _loading = false;
    });
  }

  List<Widget> chipList() {
    List<Widget> widgets = [];
    for (final (index, ing) in ingredients.indexed) {
      widgets.add(Chip(
        label: Text(ing),
        deleteIcon: const Icon(Icons.close),
        deleteIconColor: Colors.red,
        onDeleted: () => onDeleteIngredient(index),
      ));
    }
    return widgets;
  }

  void addIngredient() {
    setState(() {
      ingredients.add(_ingredientController.text);
      _ingredientController.clear();
    });
    Navigator.of(context).pop();
  }

  void onDeleteIngredient(int index) {
    setState(() {
      ingredients.removeAt(index);
    });
  }

  void ajouterIngredient() {
    showDialog(
        context: context,
        builder: (context) => DialogBoxWidget(
              controller: _ingredientController,
              onSave: addIngredient,
            ));
  }
}
