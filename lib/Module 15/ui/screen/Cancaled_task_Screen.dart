import 'package:flutter/material.dart';
import 'package:ostad_flutter/Module%2015/ui/widget/Task_Card_widget.dart';



class CanceledTaskScreen extends StatefulWidget {
  const CanceledTaskScreen({super.key});

  @override
  State<CanceledTaskScreen> createState() => _CanceledTaskScreenState();
}

class _CanceledTaskScreenState extends State<CanceledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  itemCount: 50,
                  itemBuilder: (contex, index) {
                    return Task_card_widgt(Buttoncolor: Colors.red);

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
