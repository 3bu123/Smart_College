import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../data/courses_json.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                width: double.infinity,
                height: 220,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assests/appbar.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Hello, \nAbdullah Wajdi',
                          style: TextStyle(fontSize: 25, color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 1, 104, 132)),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 26,
                        ),
                        suffixIcon: const Icon(
                          Icons.mic,
                          color: Colors.lightBlue,
                          size: 26,
                        ),
                        labelText: "Search Your Courses",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Academic Courses",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'See More',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(courses.length, (index) {
                var data = courses[index];
                var size = MediaQuery.of(context).size;
                bool sketchedThrough = false;
                for (int i = 0; i < mycourses.length; i++) {
                  var data2 = mycourses[i];
                  if (data['title'] == data2['title']) {
                    sketchedThrough = true;
                  }
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 20),
                  child: Container(
                    width: size.width * 0.6,
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              height: size.width * 0.4,
                              width: size.width * 0.6,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  data['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 7,
                              left: 7,
                              child: Container(
                                width: 90,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  '${data['semester']} Semester',
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 7, right: 7),
                          child: Text(
                            data['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                decoration: sketchedThrough
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: Colors.black87,
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7, right: 7),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    data['instructor_profile'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  width: 70,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    data['instructor_name'],
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '${data['credits']} Credits',
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Current Courses",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'See More',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            children: List.generate(
              mycourses.length,
              (index) {
                var data = mycourses[index];
                var size = MediaQuery.of(context).size;
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 19, 66, 92),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height: size.width * .17,
                                width: size.width * .17,
                                child: ClipRect(
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['title'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Instructor : ${data['instructor_name']}',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    width: size.width,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  Container(
                                    width: data['percentage'] * 2.8,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.amber.withOpacity(0.5),
                                          blurRadius: 6.0,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 50,
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${data['percentage']}%',
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
