import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartcollage/screens/courses.dart';
import 'package:smartcollage/screens/home.dart';
import 'package:smartcollage/screens/profile.dart';

// ignore: camel_case_types
class nav_main extends StatefulWidget {
  const nav_main({super.key});

  @override
  _nav_mainState createState() => _nav_mainState();
}

// ignore: camel_case_types
class _nav_mainState extends State<nav_main> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getScreen() {
    List<Widget> screen = [
      home(),
      courses(),
      profile(),
    ];
    return IndexedStack(index: screenIndex, children: screen);
  }

  Widget getFooter() {
    List bottomItems = [
      'assests/home_icon.svg',
      'assests/course_icon.svg',
      'assests/user_icon.svg',
    ];
    return Container(
      //width: ,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black45, blurRadius: 30.0, offset: Offset(0, -10))
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(21),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              bottomItems.length,
              (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        bottomItems[index],
                        height: 17.5,
                        color: screenIndex == index
                            ? Colors.black
                            : Color.fromARGB(209, 157, 151, 149),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
