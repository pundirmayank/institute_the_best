import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institute_the_best/models/course_model.dart';
import 'package:institute_the_best/models/courses_data.dart';
import 'package:institute_the_best/routing/app_router.dart';
import 'package:institute_the_best/routing/app_routes.dart';
import 'package:institute_the_best/utils/responsive_helper.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = ResponsiveHelper.getHorizontalPadding(context);

    // Placeholder course data - Replace with your actual data source (e.g., List, Map, API)
/*
    final List<Map<String, String>> courses = [
      {
        'title': 'Core Java (J2SE): The Essential Programming Foundation',
        'description': 'Absolute beginners, students starting their programming journey, professionals needing a solid Java base for advanced topics (like Android or Enterprise Java).',
        'duration': '3-4 Months',
      },
      {
        'title': 'Android App Development: Build Real-World Mobile Apps',
        'description': ' Students with Core Java knowledge, aspiring mobile developers, programmers looking to enter the mobile market',
        'duration': '3-4 Months',
      },
      {
        'title': 'Python Programming(Basic): Master the Versatile Language',
        'description': 'Beginners with no prior programming experience, data science aspirants, web developers, automation enthusiasts, anyone seeking a powerful yet easy-to-learn language.',
        'duration': '3-4 Months',
      },
      {
        'title': 'Flutter Development: Build Beautiful Cross-Platform Apps',
        'description': ' Aspiring mobile developers, web developers wanting to build mobile apps, designers interested in coding UIs, anyone looking for efficient cross-platform development.',
        'duration': '3-4 Months',
      },
      {
        'title': 'Graphics Designing Essentials: Create Compelling Visuals',
        'description': 'Aspiring graphic designers, marketing professionals, social media managers, content creators, entrepreneurs, anyone wanting to create professional-looking visuals.',
        'duration': 'Varies',
      },
      {
        'title': 'Mastering Computer Basics',
        'description': 'Builds essential digital literacy, improves efficiency in schoolwork & projects, fosters safe online habits, prepares students for future technological demands, builds confidence in using computers.',
        'duration': '3-4 Months',
      },

      {
        'title': 'Excel in Mathematics (Grades 5th - 10th)',
        'description': 'To develop a deep conceptual understanding of mathematics, enhance logical reasoning and problem-solving skills, eliminate math anxiety, and ensure academic success aligned with school curriculum.',
        'duration': '10 Months',
      },
    ];
*/

    return SingleChildScrollView(
      child: Padding(
        padding: padding.copyWith(top: 40, bottom: 50),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100), // Wider constraint for course cards
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Courses',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 15),
                const Text(
                  'Explore our range of programs designed for success.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 30),

                // Use Wrap for responsive course card layout
                Wrap(
                  spacing: 20, // Horizontal space between cards
                  runSpacing: 20, // Vertical space between rows
                  children: courses.map((course) => _buildCourseCard(context, courses.indexOf(course))).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, int index) {
    // Calculate width based on screen size for better layout
    Course course = courses[index];
    double cardWidth;
    if(ResponsiveHelper.isDesktop(context)) {
      cardWidth = 340; // Approx 3 cards per row on desktop
    } else if (ResponsiveHelper.isTablet(context)) {
      cardWidth = 300; // Approx 2 cards per row on tablet
    } else {
      cardWidth = double.infinity; // Full width on mobile
    }

    return SizedBox(
      width: cardWidth,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.title ?? 'Course Title',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.teal[700]),
              ),
              const SizedBox(height: 15),
              Text(
                course.whyLearn ?? 'Course description goes here.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Row( // Duration Info
                children: [
                  const Icon(Icons.timer_outlined, size: 16, color: Colors.black54),
                  const SizedBox(width: 5),
                  Text(
                    'Duration: ${course.duration ?? 'N/A'}',
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to a specific course detail page or show more info
                  // Example: GoRouter.of(context).go('/courses/${course['id']}');
                 /* ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Details for ${course['title']} coming soon!'))
                  );*/
                  GoRouter.of(context).go('/courses/$index');
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
                child: const Text('Learn More'),
              )
            ],
          ),
        ),
      ),
    );
  }
}