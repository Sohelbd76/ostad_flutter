import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module8/homework1.dart';

class lifeCycle extends StatefulWidget {

   lifeCycle({super.key}){
     print('1 Constracture');
   }

  @override
  State<lifeCycle> createState() {
     print('2 create state');
     return _counterAppState();
  }

}

class _counterAppState extends State<lifeCycle> {
  int number = 0;

  @override
  void initState() {
    // TODO: implement initState
    print('3 Init state');
    super.initState();
  }
// App off korar aga ki korata chai sai method akane dita pari
  @override
  void deactivate() {
    // TODO: implement deactivate
    print('4 deactive');
    super.deactivate();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    print('5 dispose');
    super.dispose();
  }


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
                  )),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homework1()));
              }, child: Text('Rought'))
            ],
          )
        ],
      ),
    );
  }
}
