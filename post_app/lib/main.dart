import 'package:flutter/material.dart';
import 'package:post_app/provider/bien_provider.dart';
import 'package:post_app/screens/bien_list_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BienProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des biens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BienListScreen(),
    );
  }
}