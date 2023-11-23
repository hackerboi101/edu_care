class CourseModule {
  String moduleName;
  String startTime;
  String startTimeFormatted;

  CourseModule({
    required this.moduleName,
    required this.startTime,
    this.startTimeFormatted = '',
  });

  factory CourseModule.fromFirestore(Map<String, dynamic> data) {
    return CourseModule(
      moduleName: data['Module Name'] ?? '',
      startTime: data['Start time'] ?? '',
    );
  }
}
