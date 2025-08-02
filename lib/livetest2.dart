import 'package:flutter/material.dart';

class livetest2 extends StatelessWidget {
  const livetest2({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Employe'),
          centerTitle: true,
        ),
        body: Column(children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Age',
                      ),
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Salary',
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {}, child: Text('Add Employee')),
        ]));
  }
}
