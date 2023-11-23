import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:edu_care/models/course_module_model.dart';

class CourseModuleController extends GetxController {
  RxList<CourseModule> courseModules = <CourseModule>[].obs;

  Future<void> fetchCourseModules(String courseFullName) async {
    try {
      CollectionReference courseModulesCollection = FirebaseFirestore.instance
          .collection('Course Modules')
          .doc(courseFullName)
          .collection(courseFullName);

      QuerySnapshot querySnapshot = await courseModulesCollection.get();

      courseModules.clear();

      courseModules.assignAll(
        querySnapshot.docs.map(
          (doc) {
            CourseModule courseModule =
                CourseModule.fromFirestore(doc.data() as Map<String, dynamic>);

            courseModule.startTimeFormatted =
                parseStartTime(courseModule.startTime);
            return courseModule;
          },
        ),
      );

      courseModules.sort((a, b) =>
          DateTime.parse('1970-01-01 ${a.startTimeFormatted}')
              .compareTo(DateTime.parse('1970-01-01 ${b.startTimeFormatted}')));
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error fetching and sorting course modules: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String parseStartTime(String startTime) {
    try {
      if (startTime.contains(':') && startTime.split(':').length == 2) {
        DateTime dateTime = DateFormat('mm:ss').parse(startTime);
        return DateFormat('HH:mm:ss').format(dateTime);
      } else {
        DateTime dateTime = DateFormat('HH:mm:ss').parse(startTime);
        return DateFormat('HH:mm:ss').format(dateTime);
      }
    } catch (e) {
      return '00:00:00';
    }
  }
}
