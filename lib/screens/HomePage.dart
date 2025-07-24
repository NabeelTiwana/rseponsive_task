import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xffefefe5),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffefefe5),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MyAppbar(),
                SizedBox(height: 10,),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                     decoration: BoxDecoration(

                     ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Icon(Icons.search, color: Colors.grey, size: 24),
        ),
        Text(
          'BRANDSDEKHO.AI',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
       Icon(Icons.notifications_none, color: Colors.indigo, size: 24),
      ],
    );
  }
}
