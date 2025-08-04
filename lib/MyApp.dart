import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2011/counterApp.dart';
import 'package:ostad_flutter/Module%2011/lifeCycle.dart';
import 'package:ostad_flutter/Module8/GridView.dart';
import 'package:ostad_flutter/Module8/stack.dart';
import 'package:ostad_flutter/livetest2.dart';
import 'package:ostad_flutter/module9/alart.dart';
import 'package:ostad_flutter/module9/drawer.dart';
import 'package:ostad_flutter/module9/test.dart';
// import 'package:ostad_flutter/Home.dart';
// import 'package:ostad_flutter/Field.dart';

import 'Module 11/faceBook_login_page.dart';
import 'assignment2.dart';
import 'Module8/GridView_Builder.dart';
import 'Module8/assignment.dart';
import 'Module8/formfield.dart';
import 'Module8/listView.dart';
import 'Module8/homework1.dart';
import 'module9/widget.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // theme: ThemeData(
     //   brightness: Brightness.light,
     //   primaryColor: Colors.red,
     //   primarySwatch: Colors.red,
     //   scaffoldBackgroundColor: Colors.grey,
     // appBarTheme: AppBarTheme(
     //  color: Colors.red,
     //   titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30)
     // ),
     //   elevatedButtonTheme: ElevatedButtonThemeData(
     //     style: ElevatedButton.styleFrom(
     //       backgroundColor: Colors.green,
     //       foregroundColor: Colors.white,
     //       shape: RoundedRectangleBorder(
     //         borderRadius: BorderRadius.circular(10),
     //       )
     //     )
     //     ),
     //   textTheme: TextTheme(
     //     displayLarge:TextStyle(
     //       fontSize: 32,fontWeight: FontWeight.bold,color: Colors.purple
     //     )
     //   ),
     //   inputDecorationTheme: InputDecorationTheme(
     //     border: OutlineInputBorder(
     //       borderRadius: BorderRadius.circular(10),
     //     ),
     //   )
     //   ),

      title: 'Sohel Flutter',
      debugShowCheckedModeBanner: false,
      home:lifeCycle()
    );
  }
}
