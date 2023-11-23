import 'package:edu_care/controllers/authentication_controller.dart';
import 'package:edu_care/controllers/course_controller.dart';
import 'package:edu_care/controllers/course_module_controller.dart';
import 'package:edu_care/views/course_player_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  final CourseController courseController = Get.put(CourseController());
  final CourseModuleController courseModuleController =
      Get.put(CourseModuleController());

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
                      height: 270,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: enrolledCourses.length,
                        itemBuilder: (context, index) {
                          final course = enrolledCourses[index];

                          return Container(
                            width: 270,
                            height: 270,
                            margin: const EdgeInsets.only(right: 13),
                            padding: const EdgeInsets.all(5),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    '${course.thumbnail}',
                                    fit: BoxFit.fill,
                                    height: 180,
                                    width: double.infinity,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 5.0,
                                    ),
                                    height: 30,
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                        '${course.fullName}',
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(187, 187, 187, 1),
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await courseController
                                          .fetchSpecificCourse(course.name);
                                      await courseModuleController
                                          .fetchCourseModules(course.fullName);
                                      Get.to(CoursePlayerPage());
                                    },
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                        Color.fromRGBO(187, 187, 187, 1),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Color.fromARGB(255, 66, 18, 62),
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
