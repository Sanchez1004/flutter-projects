import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_characters_list/src/pages/detail_page.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {

  double screenWidth = 0;

  final titleTextStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width - 50;

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text("Covers", style: titleTextStyle,),
          const SizedBox(height: 15),
          Row(
            children: [
              coverBlocks("p1.jpg", "Cover ", "2018"),
              SizedBox(width: screenWidth * 0.03,),
              coverBlocks("p2.jpg", "Cover ", "2022"),
              SizedBox(width: screenWidth * 0.03,),
              coverBlocks("p3.jpg", "Cover ", "2024"),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              charactersBlock("Brook", Colors.deepPurple, "o1"),
              charactersBlock("Luffy", Colors.yellow, "o2"),
              charactersBlock("Portgas D. Ace", Colors.red, "o3"),
              charactersBlock("Boa Hancock", Colors.lightBlueAccent, "o4"),
              charactersBlock("Boa Hancock", Colors.pinkAccent, "o5"),
              charactersBlock("Roronoa Zoro", Colors.green, "o6"),
            ],
          ),
        ],
      ),
    );
  }

  Widget coverBlocks(String image, String title, String subtitle) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            "assets/$image",
            width: screenWidth * 0.3133,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        RichText(text: TextSpan(
          text: title,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
          children: [
            TextSpan(
                text: subtitle,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 14
                )
            )
          ]
        ))
      ],
    );
  }

  Widget charactersBlock(String name, Color color, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => DetailPage(
            name: name,
            color: color,
            image: image,
          ),
        ));
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(66, 43, 43, 43),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: color,
                        blurRadius: 8,
                        spreadRadius: -2,
                        blurStyle: BlurStyle.inner
                      )
                    ]
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Hero(
                      tag: color,
                      child: Image.asset("assets/$image.png")
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                )
              ],
            ),
            IconButton(
                onPressed: (){},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}