import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Dummy()));
}

int cntr =0;

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState(); 
}

class _DummyState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Wait bro..."),),
      body:Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,children: [const Text("Test:"),Text("$cntr", style: const TextStyle(fontSize: 30))],)),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.plus_one),
        onPressed: () {
        setState(() {
          cntr+=1;
        });
      },),
    );
  }
}