import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institute_the_best/routing/app_routes.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'The Best Classes', // Your Institute Name
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem(context, Icons.home, 'Home', AppRoutes.home),
          _buildDrawerItem(context, Icons.info_outline, 'About Us', AppRoutes.about),
          _buildDrawerItem(context, Icons.school_outlined, 'Courses', AppRoutes.courses),
          _buildDrawerItem(context, Icons.contact_mail_outlined, 'Contact Us', AppRoutes.contact),
          // Add other items
          const Divider(),
          // Add maybe social links or other info here
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Navigate and close the drawer
        GoRouter.of(context).go(route);
        Navigator.pop(context); // Close the drawer
      },
    );
  }
}