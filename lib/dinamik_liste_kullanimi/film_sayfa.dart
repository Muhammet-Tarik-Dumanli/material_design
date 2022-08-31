import 'package:flutter/material.dart';
import 'package:material_design/dinamik_liste_kullanimi/film_detay_sayfa.dart';
import 'package:material_design/dinamik_liste_kullanimi/filmler.dart';

class FilmSayfa extends StatefulWidget {
  const FilmSayfa({Key? key}) : super(key: key);

  @override
  State<FilmSayfa> createState() => _FilmSayfaState();
}

class _FilmSayfaState extends State<FilmSayfa> {

  Future<List<Filmler>> filmleriGetir() async {
    var filmlerListesi = <Filmler>[];

    var f1 = Filmler(filmId: 1, filmAdi: "Anadoluda", filmResimAdi: "anadoluda.png", filmFiyat: 15.99);
    var f2 = Filmler(filmId: 2, filmAdi: "Django", filmResimAdi: "django.png", filmFiyat: 9.99);
    var f3 = Filmler(filmId: 3, filmAdi: "Inception", filmResimAdi: "inception.png", filmFiyat: 5.99);
    var f4 = Filmler(filmId: 4, filmAdi: "Interstellar", filmResimAdi: "interstellar.png", filmFiyat: 21.99);
    var f5 = Filmler(filmId: 5, filmAdi: "The Hateful Eight", filmResimAdi: "thehatefuleight.png", filmFiyat: 8.99);
    var f6 = Filmler(filmId: 6, filmAdi: "The Pianist", filmResimAdi: "thepianist.png", filmFiyat: 7.99);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmler"), backgroundColor: Colors.purple,),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context, snaphot){
          if(snaphot.hasData){
            var filmlerListesi = snaphot.data;
            return GridView.builder(
              itemCount: filmlerListesi!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2 / 3.5),
              itemBuilder: (context, indeks){
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilmDetaySayfa(film: film)));
                  },
                  child: Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("resimler/${film.filmResimAdi}"),
                        Text(film.filmAdi, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        Text("${film.filmFiyat} ₺", style: const TextStyle(fontSize: 16, color: Colors.blue),),
                      ],
                    ),
                  ),
                );
              },
            );
          }else {
            return const Center();
          }
        },
      ),
    );
  }
}
