import 'package:flutter/material.dart';

class MassegeScreen extends StatelessWidget {
  const MassegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Message'),
        backgroundColor: Colors.purple, // Consistent theme color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Predefined Messages Section
            const Text(
              'Predefined Messages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPredefinedMessageButton("I need help!", context),
            _buildPredefinedMessageButton("Call me urgently!", context),
            _buildPredefinedMessageButton("I'm in danger!", context),
            const SizedBox(height: 20),

            // Custom Message Section
            const Text(
              'Custom Message',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type your message here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),

            // Send Button
            ElevatedButton(
              onPressed: () {
                // Add functionality to send the message
                _showAlert(context, "Message Sent!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Send Message',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build predefined message buttons
  Widget _buildPredefinedMessageButton(String message, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: OutlinedButton(
        onPressed: () {
          // Add functionality to send the predefined message
          _showAlert(context, "Message Sent: $message");
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.purple),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 16, color: Colors.purple),
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