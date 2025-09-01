import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2013_14%20API/API_CRUD%20_Project/productItem_widget.dart';

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
        title: Text('Product list',style: TextStyle(color: Colors.white),),

       //  actions: [Column(
       //   children: [
       //     Icon(Icons.menu),
       //     Icon(Icons.brightness_3_sharp)
       //   ],
       // ),],
        centerTitle: true,backgroundColor: Colors.green,shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20))) ,
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

