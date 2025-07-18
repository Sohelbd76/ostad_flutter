import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(.2),

      appBar: AppBar(
        title: Text('Ostad'),
        backgroundColor: Colors.blue.shade300,
        
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // MainAxisAlignment.center;
              //    SizedBox(height:10),
              SizedBox(height:10),
              SizedBox(
                  width: double.infinity,
              child:
              ElevatedButton(onPressed: (){print('Enter');},child: Text('Submit'),
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        
        
              ),),
        
              SizedBox(height: 10),
              OutlinedButton(onPressed: (){}, child: Text('outline button',style: TextStyle(color: Colors.black,
               fontSize: 20,fontWeight: FontWeight.bold,
                  ),)
        
              // FloatingActionButton(onPressed: (){print("Enter");},child: Text('Enter'),),
              ),
            SizedBox(height: 10),
            TextButton(onPressed: (){}, child: Text('Text Buttton',style: TextStyle(fontSize: 20,color: Colors.red),)),
           IconButton(onPressed: (){}, icon: Icon(Icons.phone_android,size: 30,),color: Colors.red,),
           SizedBox(height: 10,),
              IconButton(onPressed: (){print('This is Icone button');}, icon:Icon(Icons.alarm,size: 30,color: Colors.orange,)),
              GestureDetector(
               onTap: (){print('Gesture check');},
               child: Text('Gesture Check',style: TextStyle(fontSize: 20,color: Colors.grey),)),
              InkWell(
                  onDoubleTap: (){print('After double tab');},
                  child: Text('Inkwell checker',style: TextStyle(fontSize: 30,color: Colors.red),)),
        
           Padding(
        
               // padding:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
             padding: EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 30),
               child: Text('Padding checking Padding checking Padding checking Padding checking'
                   'Pa checking Padding checking'
                   'Padding checking Paddin Padding checking Padding checking Padding checking Padding checking'
               'Padding checking Padding checking Padding checking Padding checkingg checking Padding checking Padding checking'
                   'Padding checking Padding checking Padding checking Padding checking'
                   'Padding checking Padding checking Padding checking Padding checking ',style: TextStyle(fontSize: 40),))
        
        
            ],
          ),
        ),
      )
    );
  }
}
