import 'package:flutter/material.dart';

import 'listView.dart';

class formField extends StatelessWidget {
  const formField({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey= GlobalKey<FormState>();
    TextEditingController phoneController =TextEditingController();
    TextEditingController passwordController =TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(
            'Form field checked',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              // Image.network(
              //   'https://storage.googleapis.com/gweb-uniblog-publish-prod/images/YT_logo.max-700x3000.format-webp.webp',
              //   width: 200,
              // ),
              // SizedBox(height: 10,),
              Image.asset('asset/Linkedin-Logo.png',height: 100,width: 200,),
           Form(
               key: _formKey,
               child:
               Padding(

                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   // mainAxisAlignment: MainAxisAlignment.center,
                   // crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     TextFormField(

                       controller: phoneController,
                       decoration: InputDecoration(
                         hintText: 'Enter your user address',
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                       ),
                       validator:(value){
                         if(value == null){
                           return 'Please enter phone number';
                         }
                         else if (value.length <11 || value.length >11){
                           return "enter valid phone number";
                         }
                         else{
                           return null;
                         }
                       }
                     ),
                     SizedBox(height: 20,),
                     TextFormField(

                       controller: passwordController,
                       decoration: InputDecoration(
                         hintText: 'Enter password',
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                       )
                       ),
                       validator: (value){
                         if(value== null || value.isEmpty){
                           return 'enter password';
                         }
                         else if(value.length> 6 || value.length<6){
                           return 'password should be in between 6 digits';
                         }
                         else{
                           return null;
                         }
                       },
                     ),
                     SizedBox(height: 20,),
                     Card(
                       child: SizedBox(
                         width: double.infinity,
                         child: ElevatedButton(
                             style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                             onPressed: (){
                           if(_formKey.currentState!.validate()){

                             // Navigator.push(context, MaterialPageRoute(builder: (context)=> listV()));
                             ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(content: Text('Login success')));

                           };
                         }, child: Text('Login',style: TextStyle(
                           fontWeight: FontWeight.bold,
                         ),)),
                       ),
                     )
                   ],
                 ),
               )
           ),
            ]),
          ),
        ));
  }
}
