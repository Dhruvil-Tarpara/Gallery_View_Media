import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gallery_view/gallerieView.dart';
import 'package:gallery_view/globals.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/' : (context) => const MyApp(),
        'viewpage' : (context) => const ViewPage(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff0f5f5),
        title: const Text(
          "Galleries View",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount: 10,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: Globals.imageView.map((e) {
              int index = Globals.imageView.indexOf(e);
              return StaggeredGridTile.count(
                crossAxisCellCount: e['cross'],
                mainAxisCellCount: e['main'],
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed('viewpage',arguments: index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: NetworkImage(e['image'][0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
