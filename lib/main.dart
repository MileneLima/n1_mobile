import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:n1_mobile/firebase_options.dart';
import 'package:n1_mobile/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(MaterialApp(
    title: "Lista Flutter",
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}


