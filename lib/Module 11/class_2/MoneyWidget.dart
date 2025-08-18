import 'package:flutter/material.dart';
class cardWidget extends StatelessWidget {
 final String title;
  final double value;
  Color? color;

   cardWidget({
    super.key, required this.title, required this.value,this.color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(title,style: TextStyle(fontSize: 16,color: Colors.white),),
            Text(value.toString(),style: TextStyle(fontSize: 16,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}