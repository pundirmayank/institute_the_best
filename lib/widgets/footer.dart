import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institute_the_best/constants/app_theme.dart';
import 'package:institute_the_best/utils/responsive_helper.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher


class Footer extends StatelessWidget {
  const Footer({super.key});

  // Helper function to launch URLs
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // Log or show error: Could not launch $url
      print('Could not launch $url'); // Basic error logging
    }
  }


  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    EdgeInsets padding = ResponsiveHelper.getHorizontalPadding(context);

    return Container(
      color: AppColors.footerBackground, // A slightly different background
      padding: padding.copyWith(top: 10, bottom: 10), // Vertical padding
      child: Center( // Center the content within the available width
        child: ConstrainedBox( // Limit the maximum width of the footer content
          constraints: const BoxConstraints(maxWidth: 1200), // Max width for desktop
          child: Wrap( // Use Wrap for responsiveness
            alignment: WrapAlignment.spaceBetween, // Space items out
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 10, // Spacing between rows when wrapped
            spacing: 20,    // Spacing between items in a row
            children: [
              // Column 1: Institute Info
              _buildFooterColumn(
                title: 'The Best Classes', // Your Institute Name
                children: [
                  const Text('Khyati Arcade, L block, Shastri Nagar, Meerut'),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () => _launchUrl('tel:9654676790'),
                    child: const Text('Phone: 9654676790'),
                  ),
                  const SizedBox(height: 8,),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('https://wa.me/919654676790?text=Hi sir'),
                          mode: LaunchMode.externalApplication);
                    },
                    child: const Text("WhatsApp: 9654676790"),
                  )
                  /* const SizedBox(height: 8),
                  InkWell(
                    onTap: () => _launchUrl('mailto:info@elitecoaching.com'),
                    child: const Text('Email: info@elitecoaching.com'),
                  ),*/
                ],
              ),

              // Column 2: Quick Links
              _buildFooterColumn(
                title: 'Quick Links',
                children: [
                  _footerLink(context, 'About Us', '/about'),
                  _footerLink(context, 'Courses', '/courses'),
                 // _footerLink(context, 'Admissions', '/admissions'), // Example
                  _footerLink(context, 'Contact Us', '/contact'),
                 // _footerLink(context, 'Privacy Policy', '/privacy'), // Example
                ],
              ),

              // Column 3: Social Media
              _buildFooterColumn(
                title: 'Follow Us',
                children: [
                  // Replace # with your actual social media links
                  Row(
                    mainAxisSize: MainAxisSize.min, // Keep icons close
                    children: [
                      _socialIcon(Icons.facebook, 'https://facebook.com/#'),
                      const SizedBox(width: 15),
                      _socialIcon(Icons.link, 'https://twitter.com/#'), // Placeholder icon
                      const SizedBox(width: 15),
                      _socialIcon(Icons.link, 'https://linkedin.com/#'), // Placeholder icon
                      const SizedBox(width: 15),
                      _socialIcon(Icons.link, 'https://instagram.com/#'), // Placeholder icon
                    ],
                  ),
                ],
              ),

              // Copyright - Spans full width at the bottom potentially
              Container(
                width: double.infinity, // Ensure it takes full width if wrapped
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  '© ${DateTime.now().year} The Best Classes Institute. All Rights Reserved.',
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterColumn({required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0), // Add padding below each column on mobile wrap
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Take minimum vertical space
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 15),
          ...children, // Spread the list of children widgets
        ],
      ),
    );
  }

  Widget _footerLink(BuildContext context, String text, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () => GoRouter.of(context).go(route),
        child: Text(
          text,
          style: const TextStyle(color: AppColors.textSecondary, decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Icon(icon, color: AppColors.textSecondary, size: 24),
    );
  }
}