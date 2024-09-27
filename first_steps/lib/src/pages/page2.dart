import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page1State();
}

class _Page1State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is the page #2"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => { Navigator.pop(context) },
        child: Icon(Icons.arrow_back))
    );
  }
}