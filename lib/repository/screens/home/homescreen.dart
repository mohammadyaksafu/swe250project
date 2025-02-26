import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESQLINK'),
        backgroundColor: Colors.purple, // Theme color for the app
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Panic Button
            ElevatedButton(
              onPressed: () {
                // Add functionality for panic button (e.g., send alerts)
                _showAlert(context, "Emergency Alert Sent!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'PANIC BUTTON',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Emergency Contacts
            _buildFeatureCard(
              icon: Icons.contacts,
              title: 'Emergency Contacts',
              description: 'Quickly access your emergency contacts.',
              onTap: () {
                // Navigate to emergency contacts screen
                _showAlert(context, "Navigate to Emergency Contacts");
              },
            ),
            const SizedBox(height: 20),

            // Share Location
            _buildFeatureCard(
              icon: Icons.location_on,
              title: 'Share Location',
              description: 'Share your live location with trusted contacts.',
              onTap: () {
                // Add functionality to share location
                _showAlert(context, "Location Shared!");
              },
            ),
            const SizedBox(height: 20),

            // Safety Tips
            _buildFeatureCard(
              icon: Icons.lightbulb_outline,
              title: 'Safety Tips',
              description: 'Learn important safety tips and guidelines.',
              onTap: () {
                // Navigate to safety tips screen
                _showAlert(context, "Navigate to Safety Tips");
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build feature cards
  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.purple),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to show alerts
  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Notification'),
        content: Text(message),
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