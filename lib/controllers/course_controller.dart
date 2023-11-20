import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_care/models/course_model.dart';

class CourseController extends GetxController {
  RxList<Course> enrolledCourses = <Course>[].obs;

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
}
