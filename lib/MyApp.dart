import 'package:flutter/material.dart';
import 'package:ostad_flutter/Home.dart';
import 'package:ostad_flutter/Field.dart';

// import 'Home.dart';
// import 'button.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Field()
    );
  }
}
