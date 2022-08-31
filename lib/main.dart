import 'package:flutter/material.dart';
import 'package:material_design/app_bar_kullanimi/app_bar_sayfa.dart';
import 'package:material_design/dinamik_liste_kullanimi/film_sayfa.dart';
import 'package:material_design/dinamik_liste_kullanimi/yemek_sayfa.dart';
import 'package:material_design/sabit_liste_kullanimi/sabit_sayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const FilmSayfa(),
    );
  }
}


