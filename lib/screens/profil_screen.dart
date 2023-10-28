import 'package:flutter/material.dart';
import 'package:iam_app_recette/services/auth_service.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profil'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const ClipRRect(
                borderRadius: BorderRadiusDirectional.all(Radius.circular(50)),
                child: Icon(Icons.person),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => {_authService.logout()},
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                  child: const Center(
                    child: Text(
                      'Deconnexion',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
