import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iam_app_recette/screens/home_screen.dart';
import 'package:iam_app_recette/screens/sign_in_screen.dart';
import 'package:iam_app_recette/screens/sign_up_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> _sub;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sub = FirebaseAuth.instance.userChanges().listen((event) {
      _navigatorKey.currentState!
          .pushReplacementNamed(event == null ? 'signin' : '');
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'IAM PROJECT 2023',
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null ? 'signin' : '',
        routes: {
          '': (context) => const HomeScreen(),
          'signin': (context) => const SignInScreen(),
          'signup': (context) => const SignUpScreen()
        });
  }
}
