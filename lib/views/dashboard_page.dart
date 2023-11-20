import 'package:edu_care/controllers/authentication_controller.dart';
import 'package:edu_care/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  final DashboardController dashboardController =
      Get.put(DashboardController());

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
      body: const Padding(
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
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
