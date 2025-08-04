import 'package:flutter/material.dart';

class counterApp extends StatefulWidget {
  const counterApp({super.key});

  @override
  State<counterApp> createState() => _counterAppState();
}

class _counterAppState extends State<counterApp> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        centerTitle: true,
        title: Text(
          'Counter App',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number++;
                      print(number);
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 35),
                  )),

              // Spacer(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number--;
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 35),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
