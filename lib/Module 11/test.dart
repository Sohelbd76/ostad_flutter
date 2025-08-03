
import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module8/formfield.dart';
class testm11 extends StatelessWidget {
  const testm11({super.key});

  @override
  Widget build(BuildContext context) {
    final _FormKey = GlobalKey<FormState>();
    TextEditingController userController =TextEditingController();
    TextEditingController passwordController =TextEditingController();
    return Scaffold(
      body:
          Center(
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
                      Text(" . "),
                      Text("More....",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),

              Form(
                key: _FormKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  if(_FormKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login success')));


                  }
                }, child: Text('Login In'))
              ],
            ),
          )

    );
  }
}
