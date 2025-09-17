import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2015/ui/widget/TM_App_bar_widget.dart';
class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController _subjectTEController =TextEditingController();
  TextEditingController _descriptionTEController =TextEditingController();
  GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_App_Bar_Widget(isUpdateProfile: null,),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                SizedBox(height: 16,),
                    Text('Add New Task',style: TextTheme.of(context).titleLarge,),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _subjectTEController,
                    textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Subject'
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller: _descriptionTEController,
                      maxLines: 6,
                      decoration: InputDecoration(
                          hintText: 'Description'
                      ),
                    ),
                    SizedBox(height: 16,),
                    FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined))

                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _subjectTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
