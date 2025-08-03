import 'package:flutter/material.dart';

class livetest2 extends StatelessWidget {
  const livetest2({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController salaryController = TextEditingController();
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
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                      validator: (value){
                        if(value== null){
                          return'Enter Name';
                        }
                        else if (value.isEmpty) {
                          return 'Name should not be empty';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Age',
                      ),
                      validator: (value){
                        if(value== null){
                          return 'Enter Age';
                        }
                        else if(value.isEmpty){
                          return 'Age should not be empty';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: salaryController,
                      decoration: InputDecoration(
                        hintText: 'Salary',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Enter Salary';
                        }
                        else if (value.isEmpty) {
                          return 'salary should not be empty';
                        }

                        return null;
                      } )
                  ],
                ),
              )),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            if(_formKey.currentState!.validate()){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Employee Added')));}
          }, child: Text('Add Employee')),
        ]));
  }
}
