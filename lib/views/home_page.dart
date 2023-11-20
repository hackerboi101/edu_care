import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edu_care/views/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100.0,
            ),
            const Text(
              'Welcome to EduCare',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(107, 30, 101, 1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'EduCare is a simple Edtech app that helps you to learn new skills and achieve your goals.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Color.fromRGBO(133, 133, 133, 1),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Image.asset(
              'assets/images/hello.png',
              height: 300.0,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(158, 44, 149, 1),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: const Text('LET\'S GO'),
            ),
          ],
        ),
      ),
    );
  }
}
