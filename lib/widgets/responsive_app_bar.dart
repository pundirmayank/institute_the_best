import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institute_the_best/routing/app_routes.dart';
import 'package:institute_the_best/utils/responsive_helper.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResponsiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Automatically hides the back button on the top route of the navigator stack.
      // Shows drawer button on mobile if drawer is available.
      automaticallyImplyLeading: ResponsiveHelper.isMobile(context),
      title: InkWell(
        onTap: () => GoRouter.of(context).go(AppRoutes.home), // Navigate home on tap
        child: Column(
          crossAxisAlignment: ResponsiveHelper.isMobile(context) ? CrossAxisAlignment.center: CrossAxisAlignment.start,
          children: [
             Text(
              'The Best Classes', // Your Institute Name or Logo Widget
               style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
            SizedBox(height: 4,),
            const Text(
              'Always deliver more than expected', // Your Institute Name
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      actions: ResponsiveHelper.isMobile(context)
          ? null // No actions on mobile, use Drawer
          : _buildDesktopActions(context), // Actions for tablet/desktop
      centerTitle: ResponsiveHelper.isMobile(context) ? true : false,
    );
  }

  List<Widget> _buildDesktopActions(BuildContext context) {
    return [
      _navButton(context, 'Home', AppRoutes.home),
      _navButton(context, 'About Us', AppRoutes.about),
      _navButton(context, 'Courses', AppRoutes.courses),
      _navButton(context, 'Contact Us', AppRoutes.contact),
      // Add other navigation items here (e.g., Gallery, Faculty)
      const SizedBox(width: 20), // Add some spacing before the end
    ];
  }

  Widget _navButton(BuildContext context, String text, String route) {
    GoRouter router;

    // Highlight the current route

    final bool isActive = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString() == route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => GoRouter.of(context).go(route),
        style: TextButton.styleFrom(
          foregroundColor: isActive ? Theme.of(context).primaryColor : Colors.black87,
          textStyle: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
        child: Text(text),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Standard AppBar height
}