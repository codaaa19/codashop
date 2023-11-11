import 'package:codashop/screens/listitem.dart';
import 'package:flutter/material.dart';
import 'package:codashop/screens/menu.dart';
import 'package:codashop/screens/shoplist_form.dart';

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
              if (item.name == "Tambah Produk") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ShopFormPage()));            
              }
              else if (item.name == "Lihat Item"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ItemPage()));  
              }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}