import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2015/ui/screen/New_task_Screen.dart';
import '../widget/TM_App_bar_widget.dart';
import 'Cancaled_task_Screen.dart';
import 'Completed_task_Screen.dart';
import 'Progress_task_Screen.dart';

class mainNavigationBarHolderScreen extends StatefulWidget {
  const mainNavigationBarHolderScreen({super.key});

  @override
  State<mainNavigationBarHolderScreen> createState() =>
      _mainNavigationBarHolderScreenState();
}

class _mainNavigationBarHolderScreenState
    extends State<mainNavigationBarHolderScreen> {
  int _selectedIndex=0;
final List<Widget> _screen=[
  NewTaskScreen(),
  ProgressTaskScreen(),
  CanceledTaskScreen(),
  CompletedTaskScreen(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TM_App_Bar_Widget(isUpdateProfile: null,),
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index){
          _selectedIndex=index;
          setState(() {
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.new_label_outlined), label: 'New'),
          NavigationDestination(
              icon: Icon(Icons.refresh), label: 'Progress'),
          NavigationDestination(
              icon: Icon(Icons.delete), label: 'Cancelled'),
          NavigationDestination(
              icon: Icon(Icons.done), label: 'Completed'),
        ],
      ),
    );
  }
}


