import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  late List pokedex = [];

  dynamic color(String type) {
    dynamic setColor;
    switch (type) {
      case "Grass": setColor = Colors.green; break;
      case "Fire": setColor = Colors.red; break;
      case "Water": setColor = Colors.blue; break;
      case "Poison": setColor = Colors.purple; break;
      case "Electric": setColor = Colors.amber; break;
      case "Rock": setColor = Colors.grey; break;
      case "Ground": setColor = Colors.brown; break;
      case "Psychic": setColor = Colors.indigo; break;
      case "Fighting": setColor = Colors.orange; break;
      case "Bug": setColor = Colors.lightGreenAccent; break;
      case "Ghost": setColor = Colors.deepPurple; break;
      case "Normal": setColor = Colors.white70; break;
      case "Dragon": setColor = Colors.blueGrey; break;
      case "Ice": setColor = Colors.lightBlueAccent; break;
      case "Flying": setColor = Colors.deepPurpleAccent; break;
      default: setColor = Colors.pink; break;
    }

    return setColor;
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokeApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 128, 64, 48),
                Color.fromARGB(255, 0, 0, 0)
              ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Stack(
          children: [
            Positioned(
              top: -80,
              right: -100,
              child: Image.asset("assets/pokeball.png", width: 220, fit: BoxFit.fitWidth,),
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Text(
                "Pokedex",
                style: TextStyle(
                  color: Colors.white70.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * .04
                ),
              ),
            ),
            Positioned(
              top: 150,
              bottom: 0,
              child: pokedex.isNotEmpty ?
              Column(
                children: [
                  Expanded(
                      child: SizedBox(
                        width: screenWidth,
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3/5,
                          ),
                          itemCount: pokedex.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: InkWell(
                                onTap: (){},
                                child: SafeArea(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: screenWidth,
                                        height: screenHeight,
                                        margin: const EdgeInsets.only(top: 80),
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius: BorderRadius.all(Radius.circular(25))
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 93,
                                              left: 15,
                                              child: Text(pokedex[index]["num"], style: TextStyle(
                                                color: const Color.fromARGB(255, 128, 64, 48),
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenHeight * .017,
                                              ),),
                                            ),
                                            Positioned(
                                              top: 110,
                                              left: 15,
                                              child: Text(pokedex[index]["name"], style: TextStyle(
                                                color: Colors.white54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenHeight * .0185,
                                              ),),
                                            ),
                                            Positioned(
                                              top: 140,
                                              left: 15,
                                              width: screenWidth * .5,
                                              height: screenHeight * .5,
                                              child: Wrap(
                                                spacing: screenHeight * .005,
                                                children: [
                                                  for (var type in pokedex[index]["type"])
                                                    Container(
                                                      width: screenWidth * .19,
                                                      alignment: Alignment.center,
                                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                      decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                                                        color: Colors.black.withOpacity(0.5),
                                                      ),
                                                      child: Text(type, style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: screenHeight * .016,
                                                          color: color(type),
                                                          shadows: [
                                                            BoxShadow(
                                                                color: color(type),
                                                                offset: const Offset(0, 0),
                                                                spreadRadius: 1.0,
                                                                blurRadius: 15
                                                            )
                                                          ]
                                                      ),),
                                                    ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topCenter,
                                        child: CachedNetworkImage(
                                          imageUrl: pokedex[index]["img"],
                                          height: 180,
                                          fit: BoxFit.fitHeight,
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                  )
                ],
              ) : const Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void fetchPokeApi() {
    var url = Uri.https("raw.githubusercontent.com", "/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body);
        pokedex = data["pokemon"];
        setState((){});
        if (kDebugMode) {
          print(pokedex);
        }
      }
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }
}