import 'package:flutter/material.dart';
import 'package:institute_the_best/utils/responsive_helper.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = ResponsiveHelper.getHorizontalPadding(context);

    return SingleChildScrollView( // Make page scrollable if content exceeds height
      child: Padding(
        padding: padding.copyWith(top: 40, bottom: 50), // Add vertical padding
        child: Center( // Center content horizontally
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900), // Limit content width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text left
              children: [
                Text(
                  'About The Best Classes Institute',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 25),
                // Placeholder Image - Replace with Image.asset or Image.network
                Container(
                  height: 300,
                  color: Colors.grey[300],
                 /* decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/bg_img1.jpg"),
                    ),
                  ),*/
                  child:  Image.asset(
                      'assets/images/bg_img1.jpg',
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 25),

                _buildSectionTitle('Our Mission'),
                const Text(
                  'To empower students with knowledge, skills, and confidence to excel in competitive examinations and achieve their academic dreams. We strive to create a stimulating learning environment that fosters critical thinking and holistic development.',
                  style: TextStyle(fontSize: 16, height: 1.5), // Add line height
                ),
                const SizedBox(height: 25),

                _buildSectionTitle('Our Vision'),
                const Text(
                  'To be the leading coaching institute recognized for its quality education, ethical practices, and unwavering commitment to student success, shaping future leaders and innovators.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 25),

                _buildSectionTitle('Our Values'),
                const Text(
                  '• Excellence: Pursuing the highest standards in teaching and learning.\n'
                      '• Integrity: Upholding honesty and ethical conduct.\n'
                      '• Dedication: Commitment to student growth and well-being.\n'
                      '• Innovation: Embracing modern teaching methodologies.\n'
                      '• Collaboration: Fostering teamwork among students and faculty.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 25),

                // Add more sections like 'Our Faculty', 'Infrastructure' etc.
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.teal),
      ),
    );
  }
}