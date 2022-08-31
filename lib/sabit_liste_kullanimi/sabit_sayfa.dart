import 'package:flutter/material.dart';

class SabitSayfa extends StatefulWidget {
  const SabitSayfa({Key? key}) : super(key: key);

  @override
  State<SabitSayfa> createState() => _SabitSayfaState();
}

class _SabitSayfaState extends State<SabitSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sabit Listeleme"),),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 1, //Oranlama : 2 -> Genişlik, 1 -> Yükseklik
        children: [
          ListTile(
            leading: const Icon(Icons.wb_sunny),
            title: const Text("Güneş"),
            subtitle: const Text("Güneş Alt Başlık"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("Güneş tıklandı!");
            },
          ),
          ListTile(
            leading: const Icon(Icons.brightness_2_rounded),
            title: const Text("Ay"),
            subtitle: const Text("Ay Alt Başlık"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("Ay tıklandı!");
            },
          ),
        GestureDetector(
          onTap: (){
            print("Yıldız tıklandı!");
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Yıldız"),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right, color: Colors.black54,)
                ],
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
