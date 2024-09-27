import 'package:first_steps/src/pages/container_page.dart';
import 'package:flutter/material.dart';

class ContainerApp extends StatelessWidget{
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Container",
      home: ContainerHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
