import 'package:flutter/material.dart';
import 'package:material_design/dinamik_liste_kullanimi/yemekler.dart';

class YemekDetaySayfa extends StatefulWidget {
  Yemekler yemek;
  YemekDetaySayfa({required this.yemek});

  @override
  State<YemekDetaySayfa> createState() => _YemekDetaySayfaState();
}

class _YemekDetaySayfaState extends State<YemekDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    var y = widget.yemek;

    return Scaffold(
      appBar: AppBar(title: Text(y.yemekAdi), backgroundColor: Colors.orange,),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${y.yemekResimAdi}"),
            Text("${y.yemekFiyat} ₺", style: const TextStyle(fontSize: 48, color: Colors.blue),),
            ElevatedButton(onPressed: () {
              print("${y.yemekAdi} sipariş verildi!");
            },
                child: const Text("SİPARİŞ VER", style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(primary: Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}
