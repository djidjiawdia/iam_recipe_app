import 'package:flutter/material.dart';
import 'package:recipe_app/components/item_widget.dart';
import 'package:recipe_app/models/recette.dart';
import 'package:recipe_app/pages/recette_form_page.dart';

class RecettesPage extends StatefulWidget {
  const RecettesPage({super.key});

  @override
  State<RecettesPage> createState() => _RecettesPageState();
}

class _RecettesPageState extends State<RecettesPage> {
  List<Recette> recettes = [
    Recette(
        nom: 'Oeuf poché',
        description: 'lorem ipsum sjd skds',
        image:
            'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
        ingredients: []),
    Recette(
        nom: 'Oeuf poché',
        description: 'lorem ipsum sjd skds',
        image:
            'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
        ingredients: []),
    Recette(
        nom: 'Oeuf poché',
        description: 'lorem ipsum sjd skds',
        image:
            'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
        ingredients: []),
    Recette(
        nom: 'Oeuf poché',
        description: 'lorem ipsum sjd skds',
        image:
            'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
        ingredients: []),
    Recette(
        nom: 'Oeuf poché',
        description: 'lorem ipsum sjd skds',
        image:
            'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
        ingredients: []),
    Recette(
        nom: 'Oeuf poché',
        description: 'lorem ipsum sjd skds',
        image:
            'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
        ingredients: []),
    Recette(
        nom: 'Oeuf poché',
        description: 'lorem ipsum sjd skds',
        image:
            'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
        ingredients: []),
    Recette(
        nom: 'Oeuf poché',
        description: 'lorem ipsum sjd skds',
        image:
            'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
        ingredients: [])
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recettes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const RecetteFormPage()))
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: recettes.length,
          itemBuilder: (context, index) {
            Recette recette = recettes[index];
            return ItemRecette(recette: recette);
          }),
    );
  }
}
