import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2011/class_2/todo.dart';


class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddNewTodoScreenState();
  }
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final TextEditingController _status =TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new todo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: InputDecoration(hintText: 'Title'),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true ) {
                    return 'Enter a valid title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionTEController,
                decoration: InputDecoration(hintText: 'Description'),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter a valid description';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _status,
                decoration: InputDecoration(
                  hintText: 'write status'
                ),
                validator: (String? value){
                  if(value?.trim().isEmpty?? true) {
                    return 'write current status';
                }
                  return null;}
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() == false) {   // jodi ai validation false hoi thahola ata ar colba na karon
                                                                       // return a kisu nai, ar jodi true hoi tahola list a data input hota thakba
                    return;
                  }

                  Todo todo = Todo(
                    title: _titleTEController.text.trim(),
                    description: _descriptionTEController.text.trim(),
                    status: _status.text.trim(),
                    // status: 'Pending',
                    createdDate: DateTime.now(),
                  );
                  Navigator.pop(context, todo);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}