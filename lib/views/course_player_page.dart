// ignore_for_file: unnecessary_null_comparison

import 'package:chewie/chewie.dart';
import 'package:edu_care/controllers/course_module_controller.dart';
import 'package:edu_care/controllers/course_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursePlayerPage extends StatelessWidget {
  final CoursePlayerController coursePlayerController =
      Get.put(CoursePlayerController());
  final CourseModuleController courseModuleController =
      Get.put(CourseModuleController());

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course Video Material',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(107, 30, 101, 1),
              ),
            ),
            const SizedBox(height: 20),
            coursePlayerController.chewieController != null
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 9 / 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Chewie(
                      controller: coursePlayerController.chewieController,
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await coursePlayerController.goToPreviousModule();
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(213, 213, 213, 1)),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(107, 30, 101, 1),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await coursePlayerController.goToNextModule();
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 213, 213, 213)),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(107, 30, 101, 1),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text('Next'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Course Modules',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(107, 30, 101, 1),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () {
                final courseModules = courseModuleController.courseModules;
                if (courseModules.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: courseModules.length,
                  itemBuilder: (context, index) {
                    final module = courseModules[index];

                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        title: Text(
                          module.moduleName,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(29, 29, 29, 1)),
                        ),
                        subtitle: Text(
                          'Start Time: ${module.startTimeFormatted}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 37, 37, 37),
                          ),
                        ),
                        onTap: () async {
                          await coursePlayerController.seekToModule(module);
                        },
                        tileColor: const Color.fromRGBO(107, 30, 101, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
