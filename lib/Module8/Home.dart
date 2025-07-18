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
    ),
    body: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        'Test 1',
        style: TextStyle(
            fontWeight: FontWeight.w200, color: Colors.grey, fontSize: 20),
      ),
      Text('Test 2'),

      Text(
        'Test 1',
        style: TextStyle(
            fontWeight: FontWeight.w200, color: Colors.grey, fontSize: 20),
      ),
      Text('Test 2'),
      Text(
        'Test 3',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    Text(
    'Test 1',
    style: TextStyle(
    fontWeight: FontWeight.w200, color: Colors.grey, fontSize: 20),
    ),
    Text('Test 2'),
    Text(
    'Test 3',
    style: TextStyle(
    fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Test 1',
        style: TextStyle(
            fontWeight: FontWeight.w200, color: Colors.grey, fontSize: 20),
      ),
      Text('Test 2'),
      Text(
        'Test 3',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      Text(
        'Test 1',
        style: TextStyle(
            fontWeight: FontWeight.w200, color: Colors.grey, fontSize: 20),
      ),
      Text('Test 2'),
      Text(
        'Test 3',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      Text(
        'Test 1',
        style: TextStyle(
            fontWeight: FontWeight.w200, color: Colors.grey, fontSize: 20),
      ),
      Text('Test 2'),
      Text(
        'Test 3',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    Text(
    'Test 4',
    style: TextStyle(
    fontWeight: FontWeight.w200, color: Colors.grey, fontSize: 20),
    ),
    Text('Test 5'),
    Text(
    'Test 6',
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.blue),
    ),
    ],
    ),
    ],
    ),
    ));

    }
}
