import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NAVBAR HOME"),
      ),
      body: Center(
        child: Text("You have pressed the button $count times", style: TextStyle(
          fontSize: 18
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => setState(() => count++),
        onPressed: () => setCounter(),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
    );
  }
  void setCounter() {
    setState(() {
      count++;
    });
  }
}
