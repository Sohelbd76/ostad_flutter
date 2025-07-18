import 'package:flutter/material.dart';

class homework1 extends StatelessWidget {
  const homework1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phonecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("list view"),centerTitle: true,backgroundColor: Colors.green,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Text('Simple Login page',style: TextStyle(fontSize: 20,backgroundColor: Colors.yellowAccent),),
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

            if(passwordcontroller.text.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(

                  SnackBar(content:Text( 'Please enter password')));
            }
            else if(passwordcontroller.text.length < 6 || passwordcontroller.text.length > 6 ){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Wrong password')));
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(passwordcontroller.text)));
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
      SizedBox(height: 10,),
      SizedBox(
        height: 40,
        width: 200,

        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){
            phonecontroller.clear();
            passwordcontroller.clear();

          },
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: Colors.blue,),
              child: Text('Clear all',
                style: TextStyle(fontSize: 30,color: Colors.red),)),
        ),

      ),
      SizedBox(height: 20),
      ]),
    );
  }
}
