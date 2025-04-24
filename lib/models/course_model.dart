// lib/models/course_model.dart
class Course {
  final String title;
  final String targetAudience;
  final String courseGoal;
  final String description;
  final List<String> keyTopics;
  final String whyLearn;
  final String duration;
  final String? prerequisite; // Optional

  Course({
    required this.title,
    required this.targetAudience,
    required this.courseGoal,
    required this.description,
    required this.keyTopics,
    required this.whyLearn,
    required this.duration,
    this.prerequisite,
  });
}