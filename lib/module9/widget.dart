import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class widget extends StatelessWidget {
  const widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget'),
      ),
      body: const NewWidget(img: '', text: '',),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String img;
  final String text;
  const NewWidget({
    super.key, required this.img, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                color: Colors.red,
                child: Image.asset(img),
              ),
              SizedBox(width: 10,),
              Container(
                color: Colors.red,
                child: Image.asset(img),
              ),
              SizedBox(width: 10,),
              Container(
                color: Colors.red,
                child: Image.asset(img),
              ),

            ],
          ),
        ),
        Text(text,style: const TextStyle(fontSize: 40,color: Colors.red,fontWeight: FontWeight.bold),),
      ],

    );

  }
}
