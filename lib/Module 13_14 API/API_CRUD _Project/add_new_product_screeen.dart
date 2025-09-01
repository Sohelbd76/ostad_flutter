import 'package:flutter/material.dart';

class addNewproduct extends StatefulWidget {
  const addNewproduct({super.key});

  @override
  State<addNewproduct> createState() => _addNewproductState();
}

class _addNewproductState extends State<addNewproduct> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _nameTEController = TextEditingController();
TextEditingController _codeTEController = TextEditingController();
TextEditingController _priceTEController = TextEditingController();
TextEditingController _quantityTEController = TextEditingController();
TextEditingController _imageURLTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new product'),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _nameTEController,
                  decoration: InputDecoration(
                    hintText: 'Product name',
                    labelText: "Product name"
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: _codeTEController,
                  decoration: InputDecoration(
                    hintText: 'Product code',
                    labelText: "Product Code"
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: _quantityTEController,
                  decoration: InputDecoration(
                      hintText: 'Quantity',
                      labelText: "Quantity "
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: _priceTEController,
                  decoration: InputDecoration(
                      hintText: 'Unit price: ',
                      labelText: "Unit price: "
                  ),
                ),
                TextFormField(
                  controller: _imageURLTEController,
                  decoration: InputDecoration(
                      hintText: 'Image URL',
                      labelText: "Image URL"
                  ),
                ),
                const SizedBox(height: 10,),
                FilledButton(onPressed: (){}, child: Text("Add product"))
              ],
            ),
          )),
    );
  }
  @override
  void dispose() {
    _priceTEController.dispose();
    _quantityTEController.dispose();
    _codeTEController.dispose();
    _nameTEController.dispose();
    _imageURLTEController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

