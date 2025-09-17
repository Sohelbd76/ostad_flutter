import 'package:flutter/material.dart';

import '../widget/Task_Card_widget.dart';
import '../widget/task_count_by_status_card.dart';
import 'add_new_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 70,
              child: ListView.separated(
                itemCount: 90,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TaskCountByStatusCode(
                    title: 'New',
                    count: 02,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 8);
                },
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemCount: 50,
                  itemBuilder: (contex, index) {
                    return Task_card_widgt(Buttoncolor: Colors.green,);

                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 8,
                    );
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: OnTabAddNewTaskScreen,
        child: Icon(Icons.add),
      ),
    );
  }

  void OnTabAddNewTaskScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewTaskScreen()));
  }
}


