import 'package:flutter/material.dart';
import 'package:onepiece_characters_list/src/animations/fade_animation.dart';
import 'package:onepiece_characters_list/src/widgets/blur_container_widget.dart';
import 'package:onepiece_characters_list/src/widgets/info_title_widget.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final Color color;
  final String image;

  const DetailPage({super.key, required this.name, required this.color, required this.image});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [widget.color, Colors.black]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    height: screenHeight * .6,
                    child: Hero(
                        tag: widget.color,
                        child: Image.asset("assets/${widget.image}.png")
                    ),
                  ),
                ),
                Positioned(
                    bottom: 1,
                    left: 10,
                    child: FadeAnimation(
                      intervalStart: 0.1,
                      intervalEnd: 0.3,
                      child: BlurContainer(
                          child: Container(
                            width: 160,
                            height: screenHeight * .065,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.1)
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                widget.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                      ),
                    )
                )
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: FadeAnimation(
                  intervalStart: 0.01,
                  child: Text("Character name: ${widget.name}", style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              )),
            SizedBox(height: screenHeight * 0.008),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: FadeAnimation(
                  intervalStart: 0.02,
                  child: Text("One Piece", style: TextStyle(
                    color: Colors.white70,
                  ),),
                ),
              ),
            ),
            SizedBox(height: screenHeight * .04),
            const FadeAnimation(
              intervalStart: 0.02,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoTitle(title: "Eiichiro Oda", subtitle: "Creator"),
                      InfoTitle(title: "Japan", subtitle: "Country"),
                    ],
                  ),
              ),
            ),
            const Spacer(),
            FadeAnimation(
              intervalEnd: 0.5,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * .06,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.color
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("Back", style: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}