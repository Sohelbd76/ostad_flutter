import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      title: const Text('Ostad'),
      centerTitle: true,
       backgroundColor: Colors.amber,shadowColor: Colors.red,

    ));
  }
}
