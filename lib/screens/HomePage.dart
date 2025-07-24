import 'package:flutter/material.dart';

import '../shape/custom_shape.dart';

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
                SizedBox(height: 10),
                MyBanner(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ListView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                             shape: BoxShape.circle,
                            ),
                            child: Padding(padding: EdgeInsets.all(5.0),child: Image.asset(),),
                          );
                        },
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

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        ClipPath(
          clipper: CustomStraightClipper(),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '50% ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                  children: [
                    TextSpan(
                      text: 'Discount',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'End of Sesin',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'More Style added Sale\nending soon',
                style: TextStyle(color: Colors.black38),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text('Shop now', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          right: -160,
          bottom: 0,
          child: Image.asset('assets/images/banner/product.png'),
        ),
      ],
    );
  }
}

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

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
