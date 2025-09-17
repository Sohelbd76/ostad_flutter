import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2015/ui/widget/Task_Card_widget.dart';



class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  itemCount: 50,
                  itemBuilder: (contex, index) {
                    return Task_card_widgt(Buttoncolor: Colors.blue,);

                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 8,
                    );
                  })),
        ],
      ),

    );
  }
}
