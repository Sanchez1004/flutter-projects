import 'package:flutter/material.dart';

class ContainerHome extends StatelessWidget {
  const ContainerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 20.0),
      child: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.red,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),//.all(Radius.circular(100))),
          child: const Text("Container Text",),
          // padding: EdgeInsets.only(left: 10.0),//all(30.0),//symmetric(vertical: 10.0, horizontal: 10.0),
        ),
      ),
    );
  }
}