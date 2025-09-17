import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_flutter/Module%2015/ui/utils/asset_paths.dart';

import 'login_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }
  Future<void> _moveToNextScreen() async {
   await Future.delayed(Duration(seconds: 3));
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> LoginScreenn()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          AssetPath.backgroundImg,
          fit: BoxFit.cover,
          width: double.maxFinite,
          height: double.maxFinite,
        ),
        Center(
          child: SvgPicture.asset(
            AssetPath.logo,
            height: 50,
          ),
        )
      ],
    ));
  }
}
