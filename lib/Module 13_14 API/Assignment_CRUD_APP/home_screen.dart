import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_flutter/Module%2013_14%20API/Assignment_CRUD_APP/product_item.dart';
import 'package:ostad_flutter/Module%2013_14%20API/Assignment_CRUD_APP/product_model.dart';
import 'package:ostad_flutter/Module%2013_14%20API/Assignment_CRUD_APP/urls.dart';

import 'add_new_product_screen.dart';

class home_screen_for_CRUD_app extends StatefulWidget {
  const home_screen_for_CRUD_app({super.key});

  @override
  State<home_screen_for_CRUD_app> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<home_screen_for_CRUD_app> {
  final List<ProductModel> _productList = [];
  bool _getProductInProgress = false;

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  Future<void> _getProductList() async {
    _productList.clear();
    _getProductInProgress = true;
    setState(() {});
// get product ar jonno uri banano hossa(API thaka data aina home screen a dakanor jonno.
    Uri uri = Uri.parse(Urls.getProductsUrl);
    Response response = await get(uri);

    debugPrint(response.statusCode.toString());   //Debug print use korta hoi code ar time a jata haker ai print info na pani
    debugPrint(response.body);

    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      for (Map<String, dynamic> productJson in decodedJson['data']) {
        // decodedJson['data'] → API response এর ভেতরের data লিস্ট
        // 'in' মানে → ওই লিস্ট থেকে একটা একটা করে Map<String, dynamic> বের হচ্ছে
        // প্রতিবার লুপ ঘোরার সময় সেটা productJson নামে আসছে

        ProductModel productModel = ProductModel.fromJson(productJson);
        // এখানে প্রতিটা productJson কে ProductModel object এ কনভার্ট করা হচ্ছে
        // ProductModel.fromJson() constructor JSON কে Dart object বানায়

        _productList.add(productModel);
        // অবজেক্টটাকে আমাদের লিস্টে যোগ করছি
      }
    _getProductInProgress = false;

    setState(() {});
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,backgroundColor: Colors.green,shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20))) ,
        actions: [
          IconButton(
            onPressed: () {
              _getProductList();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Visibility(
        visible: _getProductInProgress == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.separated(
          itemCount: _productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: _productList[index],
              refreshProductList: () {
                _getProductList();
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(indent: 70);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewProductScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}