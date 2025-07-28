import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module8/assignment.dart';
class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Icon(Icons.home,size: 30,)),
          Text('LargeScreen test',style: Theme.of(context).textTheme.displayLarge
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'enter your name',
              prefixIcon: Icon(Icons.input),
              suffixIcon: Icon(Icons.verified),
              hintStyle: TextStyle(
                color: Colors.red,fontSize: 20,
              ),
              labelText: 'Name please'
            ),

          ),
          TextField(),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Assignment()));
          }, child: Text('Check'))
        ],
      ),

    );
  }
}
