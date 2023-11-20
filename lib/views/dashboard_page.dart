import 'package:edu_care/controllers/authentication_controller.dart';
import 'package:edu_care/controllers/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  final CourseController courseController = Get.put(CourseController());

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: const Color.fromRGBO(107, 30, 101, 1),
        ),
        title: Column(
          children: [
            Image.asset(
              'assets/icons/app_icon.png',
              width: 30,
              height: 30,
              color: const Color.fromRGBO(107, 30, 101, 1),
            ),
            const SizedBox(height: 3),
            const Text(
              'EduCare',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(107, 30, 101, 1),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.0),
            Text(
              'Enrolled Courses',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(107, 30, 101, 1),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () {
                final enrolledCourses = courseController.enrolledCourses;
                if (enrolledCourses.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: enrolledCourses.length,
                        itemBuilder: (context, index) {
                          final course = enrolledCourses[index];

                          return Container(
                            width: 270,
                            height: 240,
                            margin: const EdgeInsets.only(right: 13),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              color: const Color.fromRGBO(107, 30, 101, 1),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 5.0,
                                  ),
                                  height: 30,
                                  width: double.infinity,
                                  child: Text(
                                    '${course.fullName}',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(171, 171, 171, 1),
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          '${course.thumbnail}',
                                          fit: BoxFit.fill,
                                          height: 210,
                                          width: double.infinity,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              const Color.fromRGBO(
                                                  107, 30, 101, 1),
                                            ),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          child: const Text('Continue Course'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
