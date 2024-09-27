import 'package:first_steps/src/pages/ListViewHome.dart';
import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      home: ListViewHome(),
    );
  }
}