import 'package:flutter/material.dart';
import '../data/courses_json.dart';

class courses extends StatefulWidget {
const courses({Key? key});

@override
_CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<courses> {
String _searchText = "";

@override
Widget build(BuildContext context) {
var filteredCourses = mycourses.where((course) {
var title = course['title'].toLowerCase();
return title.contains(_searchText.toLowerCase());
}).toList();
return Scaffold(
  appBar: AppBar(
    title: TextFormField(
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  
    backgroundColor: Colors.blue,
    elevation: 0.0,
  ),
  body: Column(
    children: List.generate(
      filteredCourses.length,
      (index) {
        var data = filteredCourses[index];
        var size = MediaQuery.of(context).size;

        for (int i = 0; i < filteredCourses.length; i++) {
          if (data['percentage'] == 100) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 10,
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
                    Row(
                      children: [
                        SizedBox(
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
                                      // borderRadius: BorderRadius.circular(100),
                                      // boxShadow: [
                                        // BoxShadow(
                                        //   color: Colors.amber.withOpacity(0.5),
                                        //   blurRadius: 6.0,
                                        //   offset: const Offset(0, 3),
                                        // ),
                                      // ],
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
              }
            }
            return const Text('');
          },
        ),
      ),
    );
  }
}

