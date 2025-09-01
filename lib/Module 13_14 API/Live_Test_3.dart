import 'package:flutter/material.dart';
class livetest3 extends StatefulWidget {
  const livetest3({super.key});

  @override
  State<livetest3> createState() => _livetest3State();
}

class _livetest3State extends State<livetest3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Live Test 3'),
          centerTitle: true,backgroundColor: Colors.green,shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20))) ,
    ));
  }
}
