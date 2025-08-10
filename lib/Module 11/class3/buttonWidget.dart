import 'package:flutter/material.dart';

class buttonWidget extends StatelessWidget {
  final int litter;
 IconData? imag;
 final VoidCallback onClick;

   buttonWidget({
    super.key, required this.litter,this.imag, required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          icon: Icon(imag ?? Icons.water_drop_outlined),
          label: Text( '${litter} LTR',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}