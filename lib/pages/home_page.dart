import 'package:flutter/material.dart';
import 'package:recipe_app/pages/favoris_page.dart';
import 'package:recipe_app/pages/profil_page.dart';
import 'package:recipe_app/pages/recettes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  static List<Widget> pages = [
    const RecettesPage(),
    const FavoritesPage(),
    const ProfilPage()
  ];

  void onNavigate(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPageIndex,
            onTap: onNavigate,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Accueil', tooltip: 'Accueil'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Mes favoris',
                  tooltip: 'Mes favoris'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profil',
                  tooltip: 'Mon profil'),
            ]));
  }
}
