import 'package:flutter/material.dart';
import 'package:codashop/models/item.dart';

class DetailItemPage extends StatelessWidget {
  final Item item;

  DetailItemPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${item.fields.name}',
            style: TextStyle(color: Color.fromARGB(255, 111, 8, 196)),
          ),
          backgroundColor: const Color.fromARGB(255, 16, 21, 81),
          foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.fields.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text("Item's Name: ${item.fields.name}"),
            const SizedBox(height: 10),
            Text("Item's Price: ${item.fields.price}"),
            const SizedBox(height: 10),
            Text("Item's Amount: ${item.fields.amount}"),
            const SizedBox(height: 10),
            Text("Item's Descirption: ${item.fields.description}"),
            const SizedBox(height: 10),
            Text("Date Added: ${item.fields.dateAdded}"),
          ],
        ),
      ),
    );
  }
}