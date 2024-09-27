import 'package:first_steps/src/pages/page1.dart';
import 'package:first_steps/src/pages/page2.dart';
import 'package:flutter/material.dart';

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation",
      initialRoute: "page1",
      routes: {"page1":(BuildContext context) => const Page1() , "page2":(BuildContext context) => const Page2()}
    );
  }
}
