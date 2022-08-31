import 'dart:ffi';

import 'package:flutter/material.dart';

class AppBarSayfa extends StatefulWidget {
  const AppBarSayfa({Key? key}) : super(key: key);

  @override
  State<AppBarSayfa> createState() => _AppBarSayfaState();
}

class _AppBarSayfaState extends State<AppBarSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Başlık"),
            Text("Alt Başlık", style: TextStyle(fontSize: 12),)
          ],
        ),
        leading: IconButton(onPressed: (){
          print("Home tıklandı!");
        }, icon: const Icon(Icons.home)),
        actions: [
          TextButton(onPressed: (){
            print("Çıkış tıklandı!");
          }, child: const Text("Çıkış", style: TextStyle(color: Colors.white),)),
          PopupMenuButton(
              child: const Icon(Icons.more_vert),
              itemBuilder: (context) => const [
                PopupMenuItem(child: Text("Sil"), value: 1,),
                PopupMenuItem(child: Text("Güncelle"), value: 2,),
              ],
            onSelected: (value) {
                print("$value seçildi!");
            },
          ),
        ],
      ),
      body: const Center(),
    );
  }
}
