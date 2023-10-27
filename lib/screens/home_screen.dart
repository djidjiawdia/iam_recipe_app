import 'package:flutter/material.dart';
import 'package:iam_app_recette/screens/favoris_screen.dart';
import 'package:iam_app_recette/screens/profil_screen.dart';
import 'package:iam_app_recette/screens/recettes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  static List<Widget> pages = [
    const RecettesScreen(),
    const FavorisScreen(),
    const ProfilScreen()
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
