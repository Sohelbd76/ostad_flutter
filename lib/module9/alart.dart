import 'package:flutter/material.dart';

import '../Module8/GridView_Builder.dart';
import '../Module8/stack.dart';

class alart extends StatelessWidget {
  const alart({super.key});

  @override
  Widget build(BuildContext context) {
    void cratedalartdialog() {
      showDialog(
          context: context,barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: Text('Attention'),
                content: Text('Are you want delete ?'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No !')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => gridVBuidler()));
                      },
                      child: Text("Yes"))
                ],
              ));
    }

    void createAlartdialogwithIcon() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Tamanna'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add_alert,
                          color: Colors.red,
                          size: 40,
                        ),
                        Text('Are you beautiful'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        ' তুমি চাইলে hover করতে চাও, আমি কোড কাস্টম করে দিই! ✅'),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text('Done'))
                  ],
                ),
              ));
    }

    void createSimpleDialog() {
      showDialog(
          context: context,barrierDismissible: false,
          builder: (context) => SimpleDialog(
                title: Text("Simple Dialog"),
                children: [
                  SimpleDialogOption(
                    child: Text("Option 1"),
                  ),
                  SimpleDialogOption(
                    child: Text("option 2"),
                  ),
                  TextField(),
                  SizedBox(
                    height: 30,
                    width: 10,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => stackV()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ],
              ));
    }
    void createdBottomShet(){
      showModalBottomSheet(context: context,backgroundColor: Colors.cyan,
          builder: (context)=>
      Container(


        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Chose an option'),
            ListTile(
              title: Text('Option 1'),
            ),
            ListTile(
      onTap:(){},
              title: Text('Option 2'),
            ),
            ListTile(
            onLongPress: (){},
              title: Text('Option 3')
            ),
            ],
        ),
      ));
    }
     Size ScreenSize=MediaQuery.of(context).size;


    return Scaffold(
        appBar: AppBar(
          title: Text("Alart Dialog"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    cratedalartdialog();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Alart Dialog')),
              TextButton(
                  onPressed: () {
                    createAlartdialogwithIcon();
                  },
                  child: Text("Alart button with Icon")),
              ElevatedButton(
                  onPressed: () {
                    createSimpleDialog();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent),
                  child: Text('Simple Dialog button')),
              ElevatedButton(onPressed: (){
                createdBottomShet();
              }, child: Text('Bottom Shet'))
            ,Container(
              height: ScreenSize.height*.50,
                width: ScreenSize.width*.50,
                color: Colors.red,
                child: Text('Container Size',style:TextStyle(fontSize: ScreenSize.width >600 ?80:20

                ),),
            ),
              Container(
                height: 20,
                width: 20,
                color: Colors.black,
              )
            ],
          ),
        ));
  }
}
