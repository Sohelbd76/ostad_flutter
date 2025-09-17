import 'package:flutter/material.dart';

import '../screen/UpdateProfile_screen.dart';
class TM_App_Bar_Widget extends StatelessWidget implements PreferredSizeWidget{
  const TM_App_Bar_Widget({
    super.key, required this.isUpdateProfile,
  });
final bool? isUpdateProfile;
  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: (){
          if(isUpdateProfile ?? false){
            return;
          }
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Update_Profile_Screen()));
        },
        child: Row(
          spacing: 8,
          children: [
            CircleAvatar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rabbil Hasan',style:TextTheme.of(context).bodySmall?.copyWith(color: Colors.white,fontSize: 16)),
                Text('rabbilhasan87@gmail.com',style:TextTheme.of(context).bodySmall?.copyWith(color: Colors.white,fontSize: 10)),
              ],
            )
          ],
        ),
      ),
      actions: [
        FloatingActionButton(onPressed: (){},child: Icon(Icons.logout),)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}