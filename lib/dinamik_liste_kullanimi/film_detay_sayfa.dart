import 'package:flutter/material.dart';
import 'package:material_design/dinamik_liste_kullanimi/filmler.dart';

class FilmDetaySayfa extends StatefulWidget {
  Filmler film;

  FilmDetaySayfa({required this.film});

  @override
  State<FilmDetaySayfa> createState() => _FilmDetaySayfaState();
}

class _FilmDetaySayfaState extends State<FilmDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    var f = widget.film;

    return Scaffold(
      appBar: AppBar(title: Text(f.filmAdi), backgroundColor: Colors.deepPurple,),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${f.filmResimAdi}"),
            Text("${f.filmFiyat} ₺", style: const TextStyle(fontSize: 48, color: Colors.blue),),
            ElevatedButton(onPressed: (){
              print("${f.filmAdi} kiralandı!");
            }, child: const Text("KİRALA", style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(primary: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
