import 'package:flutter/material.dart';
import 'package:institute_the_best/utils/responsive_helper.dart';
import 'package:institute_the_best/widgets/footer.dart';
import 'package:institute_the_best/widgets/nav_drawer.dart';
import 'package:institute_the_best/widgets/responsive_app_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget child; // The page content to display

  const MainLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a custom ResponsiveAppBar
      appBar: const ResponsiveAppBar(),
      // Use Drawer only on mobile
      drawer: ResponsiveHelper.isMobile(context) ? const NavDrawer() : null,
      body: Column(
        children: [
          Expanded(
            // Use SingleChildScrollView to allow content scrolling
            child: SingleChildScrollView(
              child: child, // Display the actual page content here
            ),
          ),
          const Footer(), // Add the footer at the bottom
        ],
      ),
    );
  }
}