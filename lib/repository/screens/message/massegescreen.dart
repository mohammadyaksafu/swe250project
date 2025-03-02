import 'package:flutter/material.dart';
import 'package:resqlink/domain/constants/appcolors.dart';
import 'package:resqlink/repository/widgets/predefinedmessages.dart';
class MassegeScreen extends StatelessWidget {
  const MassegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* App Bar */
      appBar: AppBar(
        title: const Text('Send Message'),
        centerTitle: true,
        backgroundColor: AppColors.saffoldBackground,
      ),

      /* */
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Predefined Messages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            /*Pre defined Messages */
            PredifenedMasseges.buildPredefinedMessageButton("I need help!", context),
            PredifenedMasseges.buildPredefinedMessageButton("Call me urgently!", context),
            PredifenedMasseges.buildPredefinedMessageButton("I'm in danger!", context),


            const SizedBox(height: 20),

            /*Custom Message Section*/

            const Text(
              'Custom Message',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),


            Container(
              decoration: BoxDecoration(
                color: AppColors.saffoldBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your message here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: 3,
              ),
            ),


            const SizedBox(height: 20),

            /*Send Button */

            ElevatedButton(
              onPressed: () {
                _showAlert(context, "Message Sent!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.saffoldBackground,
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