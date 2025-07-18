import 'package:flutter/material.dart';
// import 'package:ostad_flutter/Home.dart';
// import 'package:ostad_flutter/Field.dart';

import 'Module8/formfield.dart';
import 'Module8/listView.dart';
import 'Module8/homework1.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:formField()
    );
  }
}
