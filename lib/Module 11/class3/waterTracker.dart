import 'package:flutter/material.dart';
import 'buttonWidget.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int currentInTank = 0; // মিলিলিটার
  final int goal = 5000; // ৫ লিটার

  void water(int waterAdd) {
    setState(() {
      currentInTank += waterAdd;
      if (currentInTank > goal) currentInTank = goal; // goal এর বেশি না
    });
  }

  void reset() {
    setState(() {
      currentInTank = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentInTank / goal).clamp(0, 1);


    // progress অনুযায়ী color ঠিক করা
    Color progressColor;
    if (progress < 0.3) {
      progressColor = Colors.red;
    } else if (progress < 0.7) {
      progressColor = Colors.orange;
    } else {
      progressColor = Colors.green;
    }

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          "Water's Tracker",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            // লিটার দেখানো
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                color: Colors.greenAccent,
                child: Text(
                  "Today's stuck\nTotal: ${(currentInTank).toStringAsFixed(2)} LTR",
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Progress bar
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: progressColor,
                    value: progress,
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  "${(progress * 100).toStringAsFixed(0)}%",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // Buttons
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                buttonWidget(litter: 200, onClick: () => water(200)),
                buttonWidget(litter: 500, onClick: () => water(500)),
                buttonWidget(litter: 1000, onClick: () => water(1000)),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
