// lib/pages/courses_screen.dart
import 'package:flutter/material.dart';
import 'package:institute_the_best/constants/app_theme.dart';
import 'package:institute_the_best/models/course_model.dart';
import 'package:institute_the_best/models/courses_data.dart';
import 'package:institute_the_best/utils/responsive_helper.dart';// Assuming theme is defined here

class CoursesScreen extends StatefulWidget {
   var id;
   CoursesScreen({super.key,this.id = 0});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}


class _CoursesScreenState extends State<CoursesScreen> {
  // --- Hardcoded Course Data (Replace with actual data source later) ---
  late Course course;
  @override
  void initState() {
    int index =  int.parse(widget.id);
    course= courses[index];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Use the responsive helper for padding
    EdgeInsets horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine max width for content centering
    double contentMaxWidth = 1200; // Max width for the course cards area

    return /*Container(color: Colors.amber,height: 100,width: 100,child: Text(course.title),);*/
     SingleChildScrollView(
        child: Padding(
          // Apply horizontal padding, add vertical padding
          padding: horizontalPadding.copyWith(top: 40, bottom: 60),
          child: Center( // Center the content column
            child: ConstrainedBox( // Limit the maximum width
              constraints: BoxConstraints(maxWidth: contentMaxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Our Programs',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary, // Use theme color
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Find the perfect course to kickstart or advance your career in technology and design, or strengthen your academic foundations.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 40),

                  // --- Responsive Course Grid ---
                  Wrap(
                    spacing: 25, // Horizontal space between cards
                    runSpacing: 25, // Vertical space between rows
                    children: [_buildCourseCard(context, course, screenWidth, contentMaxWidth)]//courses.map((course) => _buildCourseCard(context, course, screenWidth, contentMaxWidth)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  // --- Helper Widget to Build Each Course Card ---
  Widget _buildCourseCard(BuildContext context, Course course, double screenWidth, double contentMaxWidth) {
    // --- Responsive Card Width Calculation ---
    double cardWidth;
    // Calculate the width available within the constrained area
    double availableWidth = (screenWidth > contentMaxWidth + ResponsiveHelper.getHorizontalPadding(context).horizontal)
        ? contentMaxWidth
        : screenWidth - ResponsiveHelper.getHorizontalPadding(context).horizontal;

    int crossAxisCount = 1; // Default mobile
    if (availableWidth > 1100) {
      crossAxisCount = 3; // Desktop
    } else if (availableWidth > 720) {
      crossAxisCount = 2; // Tablet
    }

    // Calculate width based on count and spacing
    double totalSpacing = (crossAxisCount - 1) * 25; // Total horizontal spacing
    cardWidth = (availableWidth - totalSpacing) / crossAxisCount;
    // Ensure minimum width to prevent extreme squeezing
    cardWidth = cardWidth < 1100 ? 1100 : cardWidth;
    // On mobile (crossAxisCount = 1), let it take available width
    if (crossAxisCount == 1) cardWidth = availableWidth;


    return SizedBox( // Use SizedBox to control width within Wrap
      width: cardWidth,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias, // Ensures decoration respects border radius
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Take only needed vertical space
            children: [
              Text(
                course.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 15),
              _buildCardSection(
                context,
                title: 'Description',
                content: Text(course.description, style: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(height: 12),
              _buildCardSection(
                context,
                title: 'Who is this for?',
                content: Text(course.targetAudience, style: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(height: 12),
              _buildCardSection(
                context,
                title: 'What you\'ll achieve',
                content: Text(course.courseGoal, style: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(height: 12),
              _buildCardSection(
                context,
                title: 'Key Topics Covered',
                content: Column( // Use column for list items
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: course.keyTopics.map((topic) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle_outline, size: 16, color: Colors.green),
                        const SizedBox(width: 8),
                        Expanded(child: Text(topic, style: Theme.of(context).textTheme.bodyMedium)),
                      ],
                    ),
                  )).toList(),
                ),
              ),
              if (course.prerequisite != null) ...[
                const SizedBox(height: 12),
                _buildCardSection(
                  context,
                  title: 'Prerequisites',
                  content: Text(course.prerequisite!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic)),
                ),
              ],
              const SizedBox(height: 12),
              _buildCardSection(
                context,
                title: 'Why Learn This?',
                content: Text(course.whyLearn, style: Theme.of(context).textTheme.bodyMedium),
              ),

              const SizedBox(height: 25),
              Center( // Center the button
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement Enquiry Action (e.g., show dialog, navigate to contact with course info)
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Enquire about ${course.title}'))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
                  ),
                  child: const Text('Enquire Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for section titles within the card
  Widget _buildCardSection(BuildContext context, {required String title, required Widget content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        content,
        const SizedBox(height: 8), // Add space after content
        // Divider(color: Colors.grey[300]), // Optional divider
      ],
    );
  }
}