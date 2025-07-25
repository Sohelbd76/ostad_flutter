import 'package:flutter/material.dart';

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // একে Wrapper দিলে স্ক্রল সমস্যা হবে না
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOukssxPpaISy0POrDP7Q8M4rjbUtnW8SEOw&s',
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  right: 130,
                  top: 70,
                  child: Text(
                    'Explore the World',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: Card(
                    elevation: 20,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search destination...",
                        prefixIcon: Icon(Icons.search_rounded),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Top Destination',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 10,
                shrinkWrap: true, // এটা দিয়ে GridView এর Height fix করা হয়
                physics: NeverScrollableScrollPhysics(), // Nested scroll বন্ধ করে
                children: [
                  Stack(
                    children: [
                      Card(child: Image.asset('asset/paris.png'),) ,
                      Positioned(
                          bottom: 110,left: 90,
                          child: Text('Paris',style: TextStyle(color: Colors.white,fontSize: 20),))
              ]
                 ),
                  Stack(
                      children: [
                        Card(child: Image.asset('asset/maldives.png')),
                        Positioned(
                            right: 80,
                            bottom: 60,
                            child: Text('Maldives',style: TextStyle(color: Colors.white,fontSize: 20),))
                      ]
                  ),
                  Stack(
                      children: [
                        Card(child: Image.asset('asset/dubai.png')),
                        Positioned(
                            right: 80,
                            bottom: 60,
                            child: Text('Dubai',style: TextStyle(color: Colors.white,fontSize: 20),))
                      ]
                  ),
                  Stack(
                      children: [
                        Card(child: Image.asset('asset/Bali.png')),
                        Positioned(
                            right: 100,
                            bottom: 110,child: Text('Bali',style: TextStyle(color: Colors.white,fontSize: 20),))
                      ]
                  ),

                ],
              ),
            ),


          ],
        ),
      ),

    );
  }
}
