import 'package:flutter/material.dart';
import 'package:institute_the_best/utils/responsive_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  // Helper function to launch URLs
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('Could not launch $url');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open link: $url'))
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, process the data
      final name = _nameController.text;
      final email = _emailController.text;
      final subject = _subjectController.text;
      final message = _messageController.text;

      // TODO: Implement form submission logic
      // 1. Send data to a backend API (Firebase Functions, custom backend)
      // 2. Use a service like Formspree (requires pointing form action to their URL - harder with Flutter directly)
      // 3. Send an email using mailto (less reliable, opens user's email client)

      print('Form Submitted:');
      print('Name: $name');
      print('Email: $email');
      print('Subject: $subject');
      print('Message: $message');

      // Show a confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thank you for your message! We will get back to you soon.')),
      );

      // Clear the form
      _formKey.currentState!.reset();
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = ResponsiveHelper.getHorizontalPadding(context);

    return SingleChildScrollView(
      child: Padding(
        padding: padding.copyWith(top: 40, bottom: 50),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 15),
                const Text(
                  'We\'d love to hear from you! Reach out with any questions or inquiries.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 40),

                // Use LayoutBuilder for complex responsive layouts if Wrap isn't enough
                LayoutBuilder(builder: (context, constraints) {
                  bool useColumnLayout = constraints.maxWidth < 800; // Example breakpoint

                  if (useColumnLayout) {
                    // Mobile/Tablet layout: Stack vertically
                    return Column(
                      children: [
                        _buildContactInfo(context),
                        const SizedBox(height: 40),
                        _buildContactForm(context),
                        const SizedBox(height: 40),
                        _buildMapPlaceholder(context), // Map below form on mobile
                      ],
                    );
                  } else {
                    // Desktop layout: Side-by-side
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2, // Give more space to the form
                          child: _buildContactForm(context),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 1, // Less space for contact info/map
                          child: Column(
                            children: [
                              _buildContactInfo(context),
                              const SizedBox(height: 30),
                              _buildMapPlaceholder(context),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem(context, Icons.location_on_outlined, 'Our Address', 'Khyati Arcade, L block, Shastri Nagar, Meerut'),
        const SizedBox(height: 20),
        _buildInfoItem(context, Icons.phone_outlined, 'Call Us', '9654676790', onTap: () => _launchUrl('tel:9654676790')),
        const SizedBox(height: 20),
        _buildInfoItem(context, Icons.message_outlined, 'WhatsApp Us', '9654676790', onTap: () => _launchUrl('https://wa.me/919654676790?text=Hi sir')),
        const SizedBox(height: 20),

        /* _buildInfoItem(context, Icons.email_outlined, 'Email Us', 'info@elitecoaching.com', onTap: () => _launchUrl('mailto:info@elitecoaching.com')),
        const SizedBox(height: 20),*/
        _buildInfoItem(context, Icons.access_time_outlined, 'Working Hours', 'Mon - Sun: 8:00 AM - 7:00 PM\nSaturday-Sunday: Weekend classes available'),
      ],
    );
  }

  Widget _buildInfoItem(BuildContext context, IconData icon, String title, String detail, {VoidCallback? onTap}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 24),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              InkWell( // Make detail tappable if onTap is provided
                onTap: onTap,
                child: Text(
                  detail,
                  style: TextStyle(
                    fontSize: 15,
                    color: onTap != null ? Colors.blue[700] : Colors.black54, // Indicate link
                    decoration: onTap != null ? TextDecoration.underline : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send us a Message',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Your Name', border: OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Your Email', border: OutlineInputBorder()),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _subjectController,
            decoration: const InputDecoration(labelText: 'Subject', border: OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a subject';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(labelText: 'Your Message', border: OutlineInputBorder(), alignLabelWithHint: true,),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: _submitForm, // Call the submit function
            child: const Text('Send Message'),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPlaceholder(BuildContext context) {
    // Replace this with an actual map implementation if needed
    // Option 1: Link to Google Maps
    // Option 2: Use a Flutter package like google_maps_flutter_web (requires API key setup)
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[400]!)
      ),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.map_outlined, size: 50, color: Colors.grey[600]),
              const SizedBox(height: 10),
              Text('Map Placeholder', style: TextStyle(color: Colors.grey[700])),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () => _launchUrl('https://maps.app.goo.gl/EHPCqFbvGY2j85ed9'), // Replace with your address/coords
                  child: const Text('View on Google Maps')
              )
            ],
          )
      ),
    );
  }
}