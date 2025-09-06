import 'package:flutter/material.dart';
import 'Module 13_14 API/Assignment_CRUD_APP/home_screen.dart';


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
      theme: ThemeData(
        colorSchemeSeed: Colors.green,

      ),

      title: 'Sohel Flutter',
      debugShowCheckedModeBanner: false,
      home: home_screen_for_CRUD_app()
    );
  }
}
