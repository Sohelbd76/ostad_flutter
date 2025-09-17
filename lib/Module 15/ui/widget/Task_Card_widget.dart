import 'package:flutter/material.dart';

class Task_card_widgt extends StatelessWidget {
  const Task_card_widgt({
    super.key, required this.Buttoncolor,
  });
  final  Color? Buttoncolor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text('Lorem Ipsum is simply dummy'),
        subtitle:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text('descriptiondescriptionv vv vdescription vv vvdescription description description description description descriptionv description description description descriptiondescription',style: TextStyle(color: Colors.grey),),
            Text('Date: 12/12/12',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            Row(
              children: [
                Chip(label: Text('New',style: TextStyle(color: Colors.white,),),

                  backgroundColor: Buttoncolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),),
                Spacer(),
                IconButton(onPressed: (){}, icon:Icon(Icons.delete,color: Colors.red,)),
                IconButton(onPressed: (){}, icon:Icon(Icons.edit)),
              ],
            )
          ],
        )
    );
  }
}