
import 'package:flutter/material.dart';
class listV extends StatefulWidget {
  const listV({super.key});

  @override
  State<listV> createState() => _listVState();
}

class _listVState extends State<listV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  centerTitle: true,
  backgroundColor: Colors.black,
  title: Text('List View checked',
    style: TextStyle(fontSize: 30,color: Colors.white70),),
),
      body: ListView.builder(
        itemCount: 20,
          itemBuilder: (context,index){
          return ListTile(
            leading:Icon(Icons.phone,color: Colors.green,),
            trailing: Icon(Icons.delete,color: Colors.red,),
            title: Text('Sohel Rana'),
            subtitle: Text('Mob:0123455677'),
          );
          }
      
      )
    );
  }
}
