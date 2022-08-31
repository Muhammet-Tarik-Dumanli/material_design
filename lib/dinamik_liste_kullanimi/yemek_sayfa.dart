import 'package:flutter/material.dart';
import 'package:material_design/dinamik_liste_kullanimi/yemek_detay_sayfa.dart';
import 'package:material_design/dinamik_liste_kullanimi/yemekler.dart';
class YemekSayfa extends StatefulWidget {
  const YemekSayfa({Key? key}) : super(key: key);

  @override
  State<YemekSayfa> createState() => _YemekSayfaState();
}

class _YemekSayfaState extends State<YemekSayfa> {

  Future<List<Yemekler>> yemekleriGetir() async {
    var yemeklerListesi = <Yemekler>[];

    var y1 = Yemekler(yemekId: 1, yemekAdi: "Köfte", yemekResimAdi: "kofte.png", yemekFiyat: 25.99);
    var y2 = Yemekler(yemekId: 2, yemekAdi: "Ayran", yemekResimAdi: "ayran.png", yemekFiyat: 8.0);
    var y3 = Yemekler(yemekId: 3, yemekAdi: "Fanta", yemekResimAdi: "fanta.png", yemekFiyat: 10.0);
    var y4 = Yemekler(yemekId: 4, yemekAdi: "Makarna", yemekResimAdi: "makarna.png", yemekFiyat: 35.99);
    var y5 = Yemekler(yemekId: 5, yemekAdi: "Kadayıf", yemekResimAdi: "kadayif.png", yemekFiyat: 20.99);
    var y6 = Yemekler(yemekId: 6, yemekAdi: "Baklava", yemekResimAdi: "baklava.png", yemekFiyat: 45.99);

    yemeklerListesi.add(y1);
    yemeklerListesi.add(y2);
    yemeklerListesi.add(y3);
    yemeklerListesi.add(y4);
    yemeklerListesi.add(y5);
    yemeklerListesi.add(y6);

    return yemeklerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yemekler"), backgroundColor: Colors.orange,),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context, snaphot){
          if(snaphot.hasData){
            var yemeklerListesi = snaphot.data;
            return ListView.builder(
              itemCount: yemeklerListesi!.length,
              itemBuilder: (context, indeks){
                var yemek = yemeklerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => YemekDetaySayfa(yemek: yemek)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width: 150, height: 150, child: Image.asset("resimler/${yemek.yemekResimAdi}")),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(yemek.yemekAdi, style: const TextStyle(fontSize: 25),),
                            SizedBox(height: 50,),
                            Text("${yemek.yemekFiyat} ₺", style: const TextStyle(fontSize: 20, color: Colors.blue),),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
