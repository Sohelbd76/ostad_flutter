import 'package:flutter/material.dart';

class gridV extends StatelessWidget {
  const gridV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
          crossAxisCount:2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
        children: List.generate(50, (index){
            return Card(
              elevation: 50,
              color: Colors.cyanAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Icon(Icons.phone_android,color: Colors.red,size: 40,),
                 SizedBox(height: 10,),
                 Text('Cash out',style: TextStyle(fontSize: 15),),
                ],
              ),
            );
      }

        // children: [
        //   Container(
        //     color: Colors.red,
        //     height: 100,
        //     width: 50,
        //   ),
        //   Container(
        //     color: Colors.yellowAccent,  height: 100,
        //     width: 50,
        //   ),
        //   Container(
        //     color: Colors.purple,  height: 100,
        //     width: 50,
        //   ),
        //   Container(
        //     color: Colors.blue,  height: 100,
        //     width: 50,
        //   ),
        //   Container(
        //     color: Colors.black,
        //     height: 100,
        //     width: 50,
        //     child:  Icon(Icons.phone_android,size: 20,color: Colors.blue),
        //   ),



        // Icon(Icons.phone_android,size: 20,color: Colors.blue,),
        // Icon(Icons.phone_android,size: 20,color: Colors.blue,),
        // Icon(Icons.phone_android,size: 20,color: Colors.blue,),
        // Icon(Icons.phone_android,size: 20,color: Colors.blue,),

      )
    ));
  }
}
