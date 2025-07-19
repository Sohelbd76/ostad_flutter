import 'package:flutter/material.dart';
class stackV extends StatelessWidget {
  const stackV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Stack View'),
        backgroundColor: Colors.blue,
      ),
      body: 
      Column(
        children: [
          Stack(
            children: [
             Container(
               height: 250,
               width: 200,
               color: Colors.red,
          
             ),
              Container(
                height: 50,
                width: 90,
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('asset/Linkedin-Logo.png',)),
          
              ),
              Container(
                height: 100,
                width: 90,
                color: Colors.yellow,
          
              ),
            ],
          ),
          Stack(
            children: [
              Positioned(

                child: CircleAvatar(
                  radius: 80,
                  child: Image.asset('asset/Linkedin-Logo.png'),
                ),
              ),
              Positioned(
                  bottom: 15,
                  left: 40,
                  child: Text('Bangladesh')),
              Positioned(
               right: 15,
                bottom: 15,

                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.green,
                    shape: BoxShape.circle
                  ),
                ),
              )

            ],
          )
        ],
        
      ),
      
      
    );
  }
}
