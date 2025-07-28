import 'package:flutter/material.dart';

class assignment2 extends StatelessWidget {
  const assignment2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeting App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, World!',
              style: TextStyle(
                  fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome to Flutter!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.network(
              'https://w7.pngwing.com/pngs/537/866/png-transparent-flutter-hd-logo-thumbnail.png',
              scale: 3,
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Button Pressed!')));
              },
              child: Text('Press Me'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              
            ),
          ],
        ),
      ),
    );
  }
}
