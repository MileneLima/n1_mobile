import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:n1_mobile/firebase_options.dart';
import 'package:n1_mobile/login.dart';
import 'package:n1_mobile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}


