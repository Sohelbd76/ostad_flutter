import 'package:flutter/material.dart';

class TaskCountByStatusCode extends StatelessWidget {
  const TaskCountByStatusCode({
    super.key, required this.title, required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 24),
          child: Column(
            children: [
              Text('$count',style: TextTheme.of(context).titleLarge?.copyWith(color: Colors.black)),
              Text("$title",style: TextTheme.of(context).labelSmall?.copyWith(color: Colors.grey)),
            ],
          ),
        )

    );
  }
}