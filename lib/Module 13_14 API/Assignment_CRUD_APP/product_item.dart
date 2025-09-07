// Flutter UI বানানোর জন্য
import 'package:flutter/material.dart';

// API কল করার জন্য http প্যাকেজ
import 'package:http/http.dart';

// Product data model → API থেকে আসা ডেটা রাখবে
import 'package:ostad_flutter/Module%2013_14%20API/Assignment_CRUD_APP/product_model.dart';

// Update Product স্ক্রিন
import 'package:ostad_flutter/Module%2013_14%20API/Assignment_CRUD_APP/update_product_screen.dart';

// সব API এর URL গুলো আলাদা ফাইল থেকে নেবো
import 'package:ostad_flutter/Module%2013_14%20API/Assignment_CRUD_APP/urls.dart';

// ===============================
// ProductItem Widget
// ===============================

// Stateful Widget, কারণ delete করার সময় loading দেখাতে হবে
class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product, // প্রতিটা ProductModel এর ডেটা
    required this.refreshProductList, // callback ফাংশন (লিস্ট আবার রিফ্রেশ করার জন্য)
  });

  final ProductModel product; // ১টা প্রোডাক্টের তথ্য
  final VoidCallback refreshProductList; // refresh ফাংশন

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _deleteInProgress = false; // delete চলছে কিনা track করার জন্য

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // লিস্টের প্রতিটা আইটেম
      // -------- প্রোডাক্ট ইমেজ --------
      leading: Image.network(
        width: 30,
        widget.product.image, // প্রোডাক্টের ar file thaka ইমেজ URL ana
        errorBuilder: (_, __, ___) {
          // যদি ইমেজ লোড না হয় tahola errorBuilder ata control korba
          return Icon(Icons.error_outline, size: 30);
        },
      ),

      // -------- প্রোডাক্ট নাম --------
      title: Text(widget.product.name),

      // -------- প্রোডাক্ট details --------
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: ${widget.product.code}'), // প্রোডাক্ট কোড

          Row(
            spacing: 16, // দুই টেক্সটের মাঝে ফাঁকা
            children: [
              Text('Quantity: ${widget.product.quantity}'),
              Text('Unit Price: ${widget.product.unitPrice}'),
            ],
          ),

          // মোট দাম (quantity × unitPrice)
          Text(
              'Total Price: ${widget.product.quantity * widget.product.unitPrice} Taka')
        ],
      ),

      // -------- ডানপাশের অপশন (Update/Delete) --------
      trailing: Visibility(
        visible: _deleteInProgress == false, // delete না চললে menu দেখাবে
        replacement: CircularProgressIndicator(), // delete চললে loading দেখাবে

        child: PopupMenuButton<ProductOptions>(
          // ৩ ডটের মেনু button dakaba
          itemBuilder: (ctx) {
            return [
              PopupMenuItem(
                value: ProductOptions.update,
                child: Text('Update'),
              ),
              PopupMenuItem(
                value: ProductOptions.delete,
                child: Text('Delete'),
              ),
            ];
          },

          // যখন option সিলেক্ট হবে
          onSelected: (ProductOptions selectedOption) {
            if (selectedOption == ProductOptions.delete) {
              _deleteProduct(); // delete function কল হবে
            } else if (selectedOption == ProductOptions.update) {
              // Update screen এ যাবে
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateProductScreen(
                    product: widget.product, // প্রোডাক্ট পাঠিয়ে দিচ্ছি update এর জন্য
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // ===============================
  // Product delete করার function
  // ===============================
  Future<void> _deleteProduct() async {
    _deleteInProgress = true; // delete শুরু
    setState(() {}); // UI রিফ্রেশ (loading দেখাবে)

    // Delete product এর জন্য API কল
    Uri uri = Uri.parse(Urls.deleteProductsUrl(widget.product.id));
    Response response = await get(uri);

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      // যদি delete সফল হয় → লিস্ট আবার রিফ্রেশ হবে
      widget.refreshProductList();
    }

    _deleteInProgress = false; // delete শেষ
    setState(() {}); // UI আবার normal হবে
  }
}

// Update/Delete এর জন্য Enum বানানো হয়েছে
enum ProductOptions { update, delete }
