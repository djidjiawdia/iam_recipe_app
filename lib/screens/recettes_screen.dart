import 'package:flutter/material.dart';
import 'package:iam_app_recette/models/Recette.dart';
import 'package:iam_app_recette/screens/recette_form_screen.dart';
import 'package:iam_app_recette/services/recette_service.dart';
import 'package:iam_app_recette/widgets/item_recette_widget.dart';

class RecettesScreen extends StatefulWidget {
  const RecettesScreen({super.key});

  @override
  State<RecettesScreen> createState() => _RecettesScreenState();
}

class _RecettesScreenState extends State<RecettesScreen> {
  final RecetteService _recetteService = RecetteService();
  // List<Recette> recettes = [
  //   Recette(
  //       nom: 'Oeuf poché',
  //       description: 'lorem ipsum sjd skds',
  //       image:
  //           'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
  //       ingredients: []),
  //   Recette(
  //       nom: 'Oeuf poché',
  //       description: 'lorem ipsum sjd skds',
  //       image:
  //           'https://media.istockphoto.com/id/1400679988/photo/healthy-leaves-mix-salad.webp?b=1&s=170667a&w=0&k=20&c=qCQISyr7crT5OEPS2BbLuhKzRtRePBjqDpwWtjhYyiA=',
  //       ingredients: [])
  // ];

  List<Recette> recettes = [];
  Future<List<Recette>>? retrievevRecettes;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    // recettes = _recetteService.getData();
    _recetteService.getData().then((value) {
      setState(() {
        recettes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recettes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RecetteFormScreen()))
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: recettes.length,
          itemBuilder: (context, index) {
            Recette recette = recettes[index];
            return ItemRecetteWidget(recette: recette);
          }),
    );
  }
}
