
import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module8/formfield.dart';

import '../Module8/button.dart';
class testm11 extends StatelessWidget {
  const testm11({super.key});

  @override
  Widget build(BuildContext context) {
    final _FormKey = GlobalKey<FormState>();
    TextEditingController userController =TextEditingController();
    TextEditingController passwordController =TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login to Facebook",style: TextStyle(color: Colors.blue),),
        backgroundColor: Colors.white,
      ),
      body:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('asset/fbfront.png',width: double.infinity,),
                SizedBox(height: 10,),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Nederland"),
                      Text(" . "),
                      Text("Polski  "),
                      Text(". "),
                  GestureDetector(
                          onTap: (){print('Nothing');},child:Text(" More....",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),) ,
                        ),
                    ],
                  ),
                ),
            
              Form(
                key: _FormKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                    TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                      hintText: 'Phone or Email',
                      hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey)
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

                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey)
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
                  )
                  ]),
                ),),
                SizedBox(height: 10,),
                Padding(
            
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    child: ElevatedButton(onPressed: (){
                      if(_FormKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login success')));
                      }
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
            
                        child: Text('Log In',style: TextStyle(color: Colors.grey.shade300),)),
                  ),
                ),
                SizedBox(height: 10),

                TextButton(onPressed: (){}, child: Text('Forgot Password?',
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),)),
                SizedBox(height: 10),


                // Stack(
                //   children:[ Container(
                //     height: 12,
                //     width: 400,color: Colors.grey,
                //   ),
                //
                //
                //  Positioned(
                //      top: 0,
                //      left: 200,
                //      child: Text('OR',style: TextStyle(fontSize: 10)))
                //   ]
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      children: [
                        Container(

                          height: 2,
                          width: 230,
                          color: Colors.grey,
                        ),
                        Text('OR'),
                        Container(
                          height: 2,
                          width: 230,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),


                SizedBox(height: 20,),
                Padding(
            
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Button()));
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
            
                        child: Text('Create New Facebook Account',style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ],
            ),
          )

    );
  }
}
