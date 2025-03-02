import 'package:flutter/material.dart';
import 'package:resqlink/domain/constants/appcolors.dart';
import 'package:resqlink/repository/screens/ambulencehelp/ambulancehelpscreen.dart';
import 'package:resqlink/repository/widgets/buildservicebox.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: AppColors.saffoldBackground,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: AppColors.saffoldBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/boxsizelogo.png',
                height: 110,
                width: 110,
                fit: BoxFit.contain, // Adjusts the image fitting inside the container
              ),
            ),



            const SizedBox(height: 40),

            // Service Box Buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  ServiceCard.buildServiceBox(
                    icon: Icons.local_hospital,
                    title: 'Ambulance Help',
                    color: AppColors.saffoldBackground,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AmbulanceHelpPage()),
                      );
                    },
                  ),
                  ServiceCard.buildServiceBox(
                    icon: Icons.local_police,
                    title: 'Emergency Police Call',
                    color: AppColors.saffoldBackground,
                    onTap: () {
                      _showAlert(context, "Emergency Police Call Requested!");
                    },
                  ),
                  ServiceCard.buildServiceBox(
                    icon: Icons.security,
                    title: 'Emergency Army Call',
                    color: AppColors.saffoldBackground,
                    onTap: () {
                      _showAlert(context, "Emergency Army Call Requested!");
                    },
                  ),
                  ServiceCard.buildServiceBox(
                    icon: Icons.phone,
                    title: 'Emergency Important Call',
                    color: AppColors.saffoldBackground,
                    onTap: () {
                      _showAlert(context, "Emergency Important Call Requested!");
                    },
                  ),
                ],
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