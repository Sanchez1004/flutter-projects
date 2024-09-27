import 'package:flutter/material.dart';

class ListViewHome extends StatefulWidget {
  const ListViewHome({super.key});

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  final List<String> names = <String>["Number1", "Number2", "Number3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("ListView"),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index){
          return Container(
            height: 60,
            decoration: BoxDecoration(color: Colors.red),
            child: Center(child: Text("Text: ${names[index]}"),) ,
          );
        }
        // children: <Widget> [
         // Container(
          //   height: 60.0,
          //   color: Colors.red,
          //   child: Text("CONTAINER 1"),
          // ),
          // Container(
          //   height: 60.0,
          //   color: Colors.yellow,
          //   child: Text("CONTAINER 2"),
          // ),
          // Container(
          //   height: 60.0,
          //   color: Colors.green,
          //   child: Text("CONTAINER 3"),
          // )
        // ],
      ),
    );
  }
}