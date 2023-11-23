import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_care/models/course_model.dart';

class CourseController extends GetxController {
  final RxList<Course> enrolledCourses = <Course>[].obs;
  final Rx<Course?> course = Rx<Course?>(null);

  @override
  void onInit() async {
    super.onInit();
    await fetchEnrolledCourses();
  }

  Future<void> fetchEnrolledCourses() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('Enrolled Courses').get();

      enrolledCourses.clear();

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        enrolledCourses.add(Course.fromFirestore(document.data()));
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error fetching enrolled courses: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> fetchSpecificCourse(String courseName) async {
    try {
      course.value = null;

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('Enrolled Courses')
              .where('Name', isEqualTo: courseName)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        final specificCourseData = querySnapshot.docs.first.data();
        course.value = Course.fromFirestore(specificCourseData);
      } else {
        Get.snackbar(
          'Error',
          'Course not found',
          snackPosition: SnackPosition.BOTTOM,
        );
        course.value = null;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error fetching specific course: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      course.value = null;
    }
  }
}
