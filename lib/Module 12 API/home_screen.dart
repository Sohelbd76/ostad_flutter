import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2012%20API/productItem_widget.dart';


import 'add_new_product_screeen.dart';

class homeScreen_api extends StatefulWidget {
  const homeScreen_api({super.key});

  @override
  State<homeScreen_api> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen_api> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product list'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return product_Item_widget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            indent: 50,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => addNewproduct()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

