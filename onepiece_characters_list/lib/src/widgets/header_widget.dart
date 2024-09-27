import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  final titleTextStyle = const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

  final captionTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 17
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(25.0),
      height: 120.0,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 41, 40, 39),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Column(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text("One Piece", style: titleTextStyle),
             Text("Anime", style: captionTextStyle),
           ],
         ),
         Row(
           children: [
             Container(
               decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0.1),
                 borderRadius: BorderRadius.circular(10),
               ),
               child: IconButton(
                 icon: const Icon(
                     Icons.search,
                   size: 30,
                   color: Colors.white,
                 ),
                 onPressed: () => {},
               ),
             ),
             const SizedBox(
               width: 20,
             ),
             Container(
               decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0.1),
                 borderRadius: BorderRadius.circular(10),
               ),
               child: IconButton(
                 icon: const Icon(
                   Icons.notifications,
                   size: 30,
                   color: Colors.white,
                 ),
                 onPressed: () => {},
               ),
             )
           ],
         )
       ],
      ),
    );
  }
}