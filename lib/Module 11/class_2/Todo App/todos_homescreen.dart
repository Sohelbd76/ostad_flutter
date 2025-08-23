import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2011/class_2/Todo%20App/todo.dart';

import 'add_new_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = [];
  @override
  void dispose() {
    // TODO: implement dispose
    print('Dispose');
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    print('DidChargeDependence');
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  void initState() {
    print('Init state');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          Todo todo = todoList[index];

          return ListTile(
            onLongPress: () {
              todoList.removeAt(index);
              setState(() {});
            },
            title: Text(todo.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.description),
                Text('Created date: ${todo.createdDate}'),
              ],
            ),
            trailing: Text(todo.status),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Todo? todo = await Navigator.push(    // akane sudu page rought korba na sata sate onno page theaka asa data a todo object ar modda save korba
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTodoScreen()
            ),
          );

          if (todo != null) {               // jodi todo not equal to null hoi mane todo ta kono valu thaka sate todoList.add(todo) ar modda add hoba
            todoList.add(todo);
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
