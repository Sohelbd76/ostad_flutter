import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2015/ui/widget/Task_Card_widget.dart';



class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  itemCount: 50,
                  itemBuilder: (contex, index) {
                    return Task_card_widgt(Buttoncolor: Colors.pink,);

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
