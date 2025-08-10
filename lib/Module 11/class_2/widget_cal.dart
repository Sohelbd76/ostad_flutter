import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  final VoidCallback  onClick;
  final text;
  Color? color;
   ButtonWidget({
    super.key, required this.onClick, required this.text, this.color
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              backgroundColor: color  ?? Colors.grey.shade400
            ),
            onPressed:onClick, child: Text(text,
          style: TextStyle(fontSize: 20),)),
      ),
    );
  }
}