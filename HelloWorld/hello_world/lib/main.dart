// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.



import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  Column buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
 }
  Color color = Theme.of(context).primaryColor;
  Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
    const FavoriteWidget(),
    ],
  ),
);
  Widget buttonSection = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildButtonColumn(color, Icons.call, 'CALL'),
      buildButtonColumn(color, Icons.near_me, 'ROUTE'),
      buildButtonColumn(color, Icons.share, 'SHARE'),
    ],
  );
  Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);
    return MaterialApp(
      
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout demo', 
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25
                ), 
              ),
        ),
        body: ListView(
          children: [
                Image.asset(
               'image/lake.jpg',
            width: 600,
            height: 240,
               fit: BoxFit.cover,
          ),
            titleSection, 
            buttonSection,
            textSection,
               titleSection, 
            buttonSection,
            textSection,
               titleSection, 
            buttonSection,
            textSection,
          ],

        ),
        
      ),
      
    );
    
  }
   
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);
  @override
  FavoriteWidgetState createState() => FavoriteWidgetState();
}

    class FavoriteWidgetState extends State<FavoriteWidget> {
      bool _isFavorited = false;
      int _favoriteCount = 40;

      // ···
      void _toggleFavorite() {
      setState(() {
        if (_isFavorited) {
          _favoriteCount -= 1;
          _isFavorited = false;
        } else {
          _favoriteCount += 1;
          _isFavorited = true;
        }
      });
    }
      @override
      Widget build(BuildContext context) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.centerRight,
                icon: (_isFavorited
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border)),
                color: Colors.red[500],
                onPressed: _toggleFavorite,
              ),
            ),
            SizedBox(
              width: 18,
              child: SizedBox(
                child: Text('$_favoriteCount'),
              ),
            ),
          ],
        );
      }
    }

