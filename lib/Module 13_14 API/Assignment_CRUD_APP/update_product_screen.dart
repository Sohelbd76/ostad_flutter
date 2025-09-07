import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ostad_flutter/Module%2013_14%20API/Assignment_CRUD_APP/product_model.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageUrlTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameTEController.text = widget.product.name;
    _codeTEController.text = widget.product.code.toString();
    _quantityTEController.text = widget.product.quantity.toString();
    _priceTEController.text = widget.product.unitPrice.toString();
    _imageUrlTEController.text = widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update product'),
        centerTitle: true,
        backgroundColor: Colors.green,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              children: [
                TextFormField(
                  controller: _nameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Product name',
                    labelText: 'Product name',
                  ),
                ),
                TextFormField(
                  controller: _codeTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Product code',
                    labelText: 'Product code',
                  ),
                ),
                TextFormField(
                  controller: _quantityTEController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Quantity',
                    labelText: 'Quantity',
                  ),
                ),
                TextFormField(
                  controller: _priceTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Unit price',
                    labelText: 'Unit price',
                  ),
                ),
                TextFormField(
                  controller: _imageUrlTEController,
                  decoration: const InputDecoration(
                    hintText: 'Image Url',
                    labelText: 'Image Url',
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: _updateProduct,
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateProduct() async {
    if (_formKey.currentState!.validate() == false) {
      return;
    }

    final url = Uri.parse(
        'http://35.73.30.144:2008/api/v1/UpdateProduct/${widget.product.id}'
    );


    final body = jsonEncode({
      "ProductName": _nameTEController.text.trim(),
      "ProductCode": _codeTEController.text.trim(),
      "Qty": int.tryParse(_quantityTEController.text.trim()) ?? 0,
      "UnitPrice": double.tryParse(_priceTEController.text.trim()) ?? 0,
      "Img": _imageUrlTEController.text.trim(),
    });

    try {
      final response = await http.post(
        url,
         headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("The product is updated")),
        );
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Update faild code: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("There is some error $e")),
      );
    }
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _priceTEController.dispose();
    _quantityTEController.dispose();
    _imageUrlTEController.dispose();
    _codeTEController.dispose();
    super.dispose();
  }
}

// Sohel