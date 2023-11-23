import 'package:chewie/chewie.dart';
import 'package:edu_care/controllers/course_controller.dart';
import 'package:edu_care/controllers/course_module_controller.dart';
import 'package:edu_care/models/course_model.dart';
import 'package:edu_care/models/course_module_model.dart';
import 'package:edu_care/views/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class CoursePlayerController extends GetxController {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  final CourseController courseController = Get.put(CourseController());
  final CourseModuleController courseModuleController =
      Get.put(CourseModuleController());
  final RxBool isInitialized = false.obs;
  final RxString currentTimestamp = '00:00:00'.obs;

  @override
  void onInit() async {
    super.onInit();
    await initializeVideoPlayer();
    isInitialized.value = true;
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position >=
          videoPlayerController.value.duration) {
        showCongratulationsDialog();
        update();
      }
    });
  }

  Future<void> initializeVideoPlayer() async {
    final Course? currentCourse = courseController.course.value!;

    if (currentCourse != null) {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(currentCourse.video),
      );

      videoPlayerController.addListener(() {
        if (videoPlayerController.value.isInitialized) {
          isInitialized.value = true;
        }
        currentTimestamp.value = formatDuration(
          videoPlayerController.value.position,
        );
      });

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 16 / 9,
        looping: false,
        showControls: true,
        autoInitialize: true,
      );

      await chewieController.videoPlayerController.initialize().then((_) {
        chewieController.seekTo(const Duration(seconds: 0));
        update();
      }).catchError((error) {
        print('Error initializing video player: $error');
      });
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  Future<void> goToPreviousModule() async {
    final currentTimestampValue = videoPlayerController.value.position;
    final List<CourseModule> modules = courseModuleController.courseModules;
    final previousModule = modules.lastWhere(
      (module) =>
          parseDuration(module.startTimeFormatted) < currentTimestampValue,
      orElse: () => modules.first,
    );
    await seekToModule(previousModule);
  }

  Future<void> goToNextModule() async {
    final currentTimestampValue = videoPlayerController.value.position;
    final List<CourseModule> modules = courseModuleController.courseModules;
    final nextModule = modules.firstWhere(
      (module) =>
          parseDuration(module.startTimeFormatted) > currentTimestampValue,
      orElse: () => modules.last,
    );
    await seekToModule(nextModule);
  }

  Future<void> seekToModule(CourseModule module) async {
    final targetTimestamp = parseDuration(module.startTimeFormatted);
    await videoPlayerController.seekTo(targetTimestamp);
    chewieController.play();
  }

  Duration parseDuration(String formattedTime) {
    final List<String> parts = formattedTime.split(':');
    return Duration(
      hours: int.parse(parts[0]),
      minutes: int.parse(parts[1]),
      seconds: int.parse(parts[2]),
    );
  }

  void showCongratulationsDialog() {
    Get.defaultDialog(
      title: 'Congratulations!',
      middleText: 'You have finished the course!',
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.to(DashboardPage());
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
          child: Text('Claim Your Certificate'),
        ),
      ],
    );
  }

  @override
  void onClose() {
    videoPlayerController.pause();
    videoPlayerController.dispose();
    chewieController.dispose();
    super.onClose();
  }
}
