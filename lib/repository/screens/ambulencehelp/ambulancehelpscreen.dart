import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceHelpPage extends StatelessWidget {
  const AmbulanceHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambulance Help'),
        backgroundColor: Colors.red, // Red color for urgency
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Text
            const Text(
              'Request Ambulance Assistance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Form for User Details
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Location (Optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Request Ambulance Button
            ElevatedButton(
              onPressed: () {
                // Add functionality to request an ambulance
                _showConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Request Ambulance',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Map Section (Optional)
            const Text(
              'Your Location:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Map will be displayed here',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to show confirmation dialog
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Request'),
        content: const Text('Are you sure you want to request an ambulance?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // Close the dialog

              const phoneNumber = '+1234567890';
              const message = 'I need an ambulance urgently! My location is [INSERT LOCATION HERE].';

              // Create the SMS URL
              final Uri smsUri = Uri(
                scheme: 'sms',
                path: phoneNumber,
                queryParameters: {'body': message},
              );

              // Launch the SMS app
              if (await canLaunch(smsUri.toString())) {
                await launch(smsUri.toString());
                _showSuccessMessage(context); // Show success message
              } else {
                _showErrorMessage(context); // Show error message if SMS app cannot be launched
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  // Helper method to show success message
  void _showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Ambulance request has been sent successfully!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Helper method to show error message
  void _showErrorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Could not launch the SMS app. Please try again.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}