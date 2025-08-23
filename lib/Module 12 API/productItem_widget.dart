import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2012%20API/update_Screen.dart';

class product_Item_widget extends StatelessWidget {
  const product_Item_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: CircleAvatar(),
            title: Text('Product List'),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Text('Unit : 5'),
                      Text('Unit Price: 500'),
                    ],
                  ),
                  Text('Product case: 43323455 '),
                ]),
            trailing:
            PopupMenuButton<productOption>(itemBuilder: (context) {

              return [
                PopupMenuItem(
                    value: productOption.delete, child: Text('Detete')),
                PopupMenuItem(
                    value: productOption.update, child: Text('Update'))
              ];
            },
              onSelected: (productOption selectedOption){
                print(selectedOption);
                if(selectedOption == productOption.update){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> update_Screen()));
                }
                else if (selectedOption == productOption.delete){
                  print('delect');
                }
              },
            )
        )],
    );
  }
}

enum productOption { delete, update }
