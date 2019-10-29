import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atendimento", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add, color: Colors.black,),
        backgroundColor: Colors.yellow,
      ),
//      body: ListView.builder( padding: EdgeInsets.all(10.0), itemCount: , itemBuilder: (context, index)),
    );
  }
}
