import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2015/ui/screen/UpdateProfile_screen.dart';
import 'package:ostad_flutter/Module%2015/ui/screen/main_nav_bar_holder_screen.dart';
import 'package:ostad_flutter/Module%2015/ui/screen/splash_screen.dart';

class TaskManagmentApp extends StatefulWidget {
  const TaskManagmentApp({super.key});

  @override
  State<TaskManagmentApp> createState() => _TaskManagmentAppState();
}

class _TaskManagmentAppState extends State<TaskManagmentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(borderSide: BorderSide.none)),
        filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 16),
              fixedSize: Size.fromWidth(double.maxFinite),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          ),
        ),
        textTheme:TextTheme(titleLarge: TextStyle(
          fontWeight: FontWeight.w600,fontSize: 28
        ),
        bodySmall: TextStyle(color: Colors.grey,fontSize: 16)),


      ),
      home://Update_Profile_Screen(),
      // mainNavigationBarHolderScreen(),
      splash_screen(),

    );
  }
}
