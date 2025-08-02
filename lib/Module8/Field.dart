
import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phonecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Ostad',style: TextStyle(color: Colors.white,),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        body: Column(
           children: [

            Text('Login page',style: TextStyle(fontSize: 20),),
             SizedBox(height: 30,),
        TextField(
            controller: phonecontroller,
          keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter your valid phone number",
              labelText: 'Write valid phone number',
              hintStyle: const TextStyle(fontSize: 10,
          backgroundColor: Colors.yellow,fontStyle: FontStyle.italic,color: Colors.red),
              prefixIcon:const Icon(Icons.phone),
              suffixIcon: const Icon(Icons.check),
              labelStyle: const TextStyle(color: Colors.orange,fontSize: 20),
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              )

        ),

          const SizedBox(height: 10,),

          TextField(
            obscureText: true,
              controller: passwordcontroller,
              decoration: InputDecoration(
        hintText: "Enter password",
        labelText: 'Write valid password',
        hintStyle: const TextStyle(fontSize: 10,color: Colors.red,
           fontStyle: FontStyle.italic),
        prefixIcon:const Icon(Icons.lock),
        suffixIcon: const Icon(Icons.remove_red_eye),
        labelStyle: const TextStyle(color: Colors.orange,fontSize: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),

              )

          ),
             SizedBox(height: 20,),
             SizedBox(height: 30,width: double.infinity,
               child: Card(
                 child: ElevatedButton(onPressed: (){

                   if(phonecontroller.text.isEmpty){
                     ScaffoldMessenger.of(context).showSnackBar(

                         SnackBar(content:Text( 'Please enter phone number')));
                   }
                   else if(phonecontroller.text.length < 11 || phonecontroller.text.length > 11 ){
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('Phone number is incorrect')));
                   }
                 else{
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                       content: Text(phonecontroller.text)));
                   }

                   },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue
                     ),

                     child: Text('Enter',style: TextStyle(
                 fontSize: 20,fontWeight: FontWeight.bold,height: 1,

                      // decoration:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),

                 ),)),
               ),
             ),
             const SizedBox(height: 10,),
             SizedBox(
               height: 40,
               width: 200,

               child: Card(
                 child: ElevatedButton(onPressed: (){
                   phonecontroller.clear();
                   passwordcontroller.clear();

                 },
                   style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue,),
                     child: const Text('Clear all',
                   style: TextStyle(fontSize: 30,backgroundColor:Colors.blue,color: Colors.red),)),
               ),

             ),
        SizedBox(height: 20),
             Container(
               alignment: Alignment.center,
               height: 90,
               width: 320,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(200),
                   color: Colors.yellow,
               boxShadow: const [BoxShadow(
                 color: Colors.green,offset: Offset(10, 10),
               )],
                 border: Border.all(color: Colors.red,width: 10,),
               ),
               child: Text('Hello Container',style: TextStyle(fontSize: 30,
                   color: Colors.black),),



             ),
             SizedBox(height: 20,),
             Card(
               color: Colors.blue,
               child: Text("This is card",style: TextStyle(fontSize: 30,),),
             )
        ],

             ),

        );
  }
}
