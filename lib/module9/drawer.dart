import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module8/assignment.dart';
import 'package:ostad_flutter/Module8/listView.dart';
import 'package:ostad_flutter/Module8/stack.dart';
import 'package:ostad_flutter/module9/test.dart';
import 'package:ostad_flutter/module9/widget.dart';

import '../Module8/GridView_Builder.dart';

class drawerV extends StatelessWidget {
  const drawerV({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Navigation drawer'),
          bottom: TabBar(

            tabs: [
              Tab(
              icon: Icon(Icons.home),
                text: 'Home'
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Fev",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Setting",
              )
            ],

          ),
        ),
        body:




        // TabBarView(
        //   children: [
        //     Container(
        //       height: 20,
        //       width: double.infinity,
        //       color: Colors.red,
        //       child: Center(child: Text("Home",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)),
        //     ),
        //     Container(
        //       height: 20,
        //       width: double.infinity,
        //       color: Colors.green,
        //       child: Center(child: Text("Fav",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)),
        //     ),
        //     Container(
        //       height: 20,
        //       width: double.infinity,
        //       color: Colors.yellow,
        //       child: Center(child: Text("Setting",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)),
        //     ),
        //   ],
        //
        // ),




        TabBarView(
          children: [
            NewWidget(img: 'asset/paris.png', text: 'paris'),
            stackV(),
            // NewWidget(img: 'asset/maldives.png', text: 'Maldiv'),
            test(),


          ],
        ),






        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage:AssetImage('asset/Bali.png'),
                    radius: 30,
                  ),
                SizedBox(height: 10,),
                Text('Md. Rezaul Karim Sohel',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("Sohel.flutter@gmail.com",style: TextStyle(fontSize: 15),)
                ],
              )),
             Column(
               children: [
               ListTile(
                 title: Text('Recent'),
                 onTap: (){},
                 leading: Icon(Icons.access_time),
                 dense: true,
                 visualDensity: VisualDensity(horizontal: 0,vertical: 3),


               ),
                 Divider(

                 ),
                 ListTile(
                   onLongPress: (){},
                   title: Text('Offline'),
                   leading: Icon(Icons.offline_pin_sharp),
                 )
               ],
             )
            ],
          ),

        ),
      ),
    );
  }
}
