import 'package:flutter/material.dart';
import 'package:codashop/screens/shoplist_form.dart';
import 'package:codashop/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
        backgroundColor: Colors.deepPurple.shade200,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
           Color cardColor = index % 2 == 0 ? Colors.purple.shade100 : Colors.purple.shade200;
          return Card(
            elevation: 3, // Set the elevation for the card
            margin: EdgeInsets.all(15), // Set margin for the card
            color : cardColor,
            child: ListTile(
              title: Text(items[index].name),
              subtitle: Text(
                  "Item's Name: ${items[index].name} \nPrice: ${items[index].price} \nDescription: ${items[index].description}"),
              onTap: () {
                // Handle the tap event if needed
              },
            ),
          );
        },
      ),
    );
  }
}




