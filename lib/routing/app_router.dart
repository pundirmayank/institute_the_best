import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institute_the_best/pages/about_page.dart';
import 'package:institute_the_best/pages/contact_page.dart';
import 'package:institute_the_best/pages/courses_page.dart';
import 'package:institute_the_best/pages/courses_screen.dart';
import 'package:institute_the_best/pages/home_page.dart';
import 'package:institute_the_best/routing/app_routes.dart';
import 'package:institute_the_best/widgets/main_layout.dart'; // Import MainLayout

// Define a GlobalKey for the navigator (optional but can be useful)
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      // Use ShellRoute to wrap pages with the common MainLayout (AppBar, Footer)
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainLayout(child: child); // Pass the child page to MainLayout
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: AppRoutes.about,
            builder: (context, state) => const AboutPage(),
          ),
          GoRoute(
            path: AppRoutes.courses,
            builder: (context, state) => const CoursesPage(),
          ),
          // Example Detail Route (if needed)
          // GoRoute(
          //   path: AppRoutes.courseDetail, // '/courses/:id'
          //   builder: (context, state) {
          //     final courseId = state.pathParameters['id']; // Get ID from URL
          //     return CourseDetailPage(courseId: courseId ?? 'unknown');
          //   },
          // ),
          GoRoute(
            path: AppRoutes.coursesDetail,
            builder: (context, state) {
              final courseId = state.pathParameters['id'];
              return CoursesScreen(id: courseId,);
            },//(context, state) =>  CoursesScreen(),
          ),
          GoRoute(
            path: AppRoutes.contact,
            builder: (context, state) => const ContactPage(),
          ),
          // Add routes for other pages here (e.g., Gallery, Faculty)
        ],
      ),
      // Add routes outside the shell if needed (e.g., a login page without the main layout)
    ],
    // Optional: Add error handling
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.error}')),
    ),
  );
}