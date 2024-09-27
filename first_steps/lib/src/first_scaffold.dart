import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.red,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.amber,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue,
          )),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}


class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title of AppBar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("I was pressed");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
