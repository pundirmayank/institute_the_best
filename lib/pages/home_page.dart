import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institute_the_best/routing/app_routes.dart';
import 'package:institute_the_best/utils/responsive_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = ResponsiveHelper.getHorizontalPadding(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children horizontally
      children: [
        // --- Hero Section ---
        Container(
          height: ResponsiveHelper.isMobile(context) ? 400 : 600, // Adjust height
          color: Colors.grey[300], // Placeholder background
          child: Stack(
            children: [
              Image.asset(
                'assets/images/bg_img2.jpg',
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black87,
              ),
              Padding(
              padding: padding,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: ResponsiveHelper.isMobile(context)
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unlock Your Potential',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: ResponsiveHelper.isMobile(context) ? 32 : 48,
                    ),
                    textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Expert coaching for Programing languages, Graphics designing and academic excellence in Mathematics.',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.isMobile(context) ? 16 : 20,
                    ),
                    textAlign: ResponsiveHelper.isMobile(context) ? TextAlign.center : TextAlign.left,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => GoRouter.of(context).go(AppRoutes.courses),
                    child: const Text('Explore Our Courses'),
                  ),
                ],
                            ),
              )],
          ),
        ),

        // --- About Us Snippet ---
        _buildSection(
          context: context,
          title: 'Welcome to The Best Classes',
          content: const Text(
            'We are dedicated to providing top-tier education and guidance '
                'to help students achieve their academic and career goals. Learn more about our '
                'mission, vision, and experienced faculty.',
            textAlign: TextAlign.center,
          ),
          actionButton: OutlinedButton(
            onPressed: () => GoRouter.of(context).go(AppRoutes.about),
            child: const Text('Learn More About Us'),
          ),
          padding: padding,
        ),


        // --- Why Choose Us Section ---
        _buildSection(
          context: context,
          title: 'Why Choose Us?',
          backgroundColor: Colors.teal.withOpacity(0.05), // Light background
          padding: padding,
          content: Wrap( // Use Wrap for responsiveness
            spacing: 40, // Horizontal space between items
            runSpacing: 30, // Vertical space between rows
            alignment: WrapAlignment.center,
            children: [
              _buildFeatureItem(Icons.school, 'Expert Faculty', 'Learn from experienced professionals.'),
              _buildFeatureItem(Icons.book, 'Comprehensive Curriculum', 'Covering all essential topics.'),
              _buildFeatureItem(Icons.trending_up, 'Proven Results', 'Track record of student success.'),
              _buildFeatureItem(Icons.groups, 'Personalized Attention', 'Small batch sizes for focus.'),
            ],
          ),
        ),

        // --- Course Highlights ---
        _buildSection(
          context: context,
          title: 'Popular Courses',
          padding: padding,
          content: Wrap( // Use Wrap for course cards
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildCourseHighlightCard(context, 'Programing languages', 'Prepare for top engineering colleges.'),
              _buildCourseHighlightCard(context, 'Computer Basics', 'Guidance for aspiring school and college students and job seekers.'),
              _buildCourseHighlightCard(context, 'Mathematics (V to X)', 'Build a strong base for Mathematics.'),
            ],
          ),
          actionButton: ElevatedButton(
            onPressed: () => GoRouter.of(context).go(AppRoutes.courses),
            child: const Text('View All Courses'),
          ),
        ),


        // --- Testimonial Snippet ---
        _buildSection(
            context: context,
            title: 'What Our Students Say',
            backgroundColor: Colors.grey[100],
            padding: padding,
            content: const Column(
              children: [
                Icon(Icons.format_quote, size: 40, color: Colors.grey),
                SizedBox(height: 10),
                Text(
                  '"The Best Classes provided the perfect environment and support system '
                      'for my success. The teachers are excellent!"',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 10),
                Text(
                  '- Sneha, Vidya College of Engineering, Meerut',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
        ),

        const SizedBox(height: 50), // Spacer before footer
      ],
    );
  }

  // Helper widget for building sections consistently
  Widget _buildSection({
    required BuildContext context,
    required String title,
    required Widget content,
    EdgeInsets? padding,
    Color? backgroundColor,
    Widget? actionButton,
  }) {
    return Container(
      color: backgroundColor,
      padding: (padding ?? EdgeInsets.zero).copyWith(top: 50, bottom: 50), // Vertical padding
      width: double.infinity, // Take full width
      child: Center( // Center content horizontally
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000), // Limit content width
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              content,
              if (actionButton != null) ...[ // Add action button if provided
                const SizedBox(height: 30),
                actionButton,
              ]
            ],
          ),
        ),
      ),
    );
  }

  // Helper for feature items in "Why Choose Us"
  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return SizedBox( // Constrain the width of each item
      width: 200,
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.teal),
          const SizedBox(height: 15),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 5),
          Text(description, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  // Helper for course highlight cards
  Widget _buildCourseHighlightCard(BuildContext context, String title, String description) {
    return SizedBox(
      width: 280, // Adjust width as needed
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.teal)),
              const SizedBox(height: 10),
              Text(description, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () => GoRouter.of(context).go(AppRoutes.courses), // Link to courses page for now
                child: const Text('Learn More ->'),
              )
            ],
          ),
        ),
      ),
    );
  }
}