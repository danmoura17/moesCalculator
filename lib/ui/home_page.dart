import 'package:flutter/material.dart';
import 'package:moes_calculator/screens/home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atendimento Moe's",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Color.fromARGB(255,4,125,141)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
