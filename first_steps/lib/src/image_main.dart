import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageMain extends StatelessWidget {
  const ImageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Images",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Show Images"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 250.0,
                width: 200.0,
                child: Image.asset("assets/image1.jpg", fit: BoxFit.fitWidth,),
              ),
              SizedBox(
                height: 250.0,
                width: 350.0,
                // SVG format is way too lighter
                child: SvgPicture.asset("assets/fries-svg.svg", colorFilter: ColorFilter.mode(Colors.red, BlendMode.color)),
              ),
              SizedBox(
                height: 250.0,
                width: 350.0,
                child: Image.network("https://i.ibb.co/rbRNM5M/image.jpg"),

              )
            ],
          ),
        ),
      ),
    );
  }
}