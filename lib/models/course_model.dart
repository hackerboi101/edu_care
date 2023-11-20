class Course {
  String fullName;
  String name;
  String thumbnail;
  String video;

  Course({
    required this.fullName,
    required this.name,
    required this.thumbnail,
    required this.video,
  });

  factory Course.fromFirestore(Map<String, dynamic> data) {
    return Course(
      fullName: data['Full Name'] ?? '',
      name: data['Name'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      video: data['Video'] ?? '',
    );
  }
}
