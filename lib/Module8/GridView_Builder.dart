import 'package:flutter/material.dart';

class gridVBuidler extends StatelessWidget {
  const gridVBuidler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grid View'),
          backgroundColor: Colors.blue,
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
        itemCount: 30, // we the item count number from API and then according index we need to put value in API pannel
        itemBuilder:(context,index) {
              return Card(
              elevation: 50,
              color: Colors.cyanAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(Icons.phone_android,color: Colors.red,size: 20,),
    SizedBox(height: 10,),
    Text('Cash out',style: TextStyle(fontSize: 10),),
      Text(index.toString()),
    ],
    ),
    );
    },),
    );
  }
}
