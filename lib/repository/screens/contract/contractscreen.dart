import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resqlink/domain/constants/appcolors.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  PermissionStatus _contactPermissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();

    _checkContactPermission();
  }

  // Function to check contact permission status
  Future<void> _checkContactPermission() async {
    final status = await Permission.contacts.status;
    setState(() {
      _contactPermissionStatus = status;
    });
  }

  // Function to request contact permission
  Future<void> _requestContactPermission() async {
    final status = await Permission.contacts.request();
    setState(() {
      _contactPermissionStatus = status;
    });

    // If permission is permanently denied, open app settings
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.saffoldBackground,
        title: const Text("Contact Permission"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display permission status
            Text(
              "Contact Permission Status:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              _contactPermissionStatus.toString().split('.').last,
              style: TextStyle(
                fontSize: 22,
                color: _getStatusColor(_contactPermissionStatus),
              ),
            ),
            SizedBox(height: 30),
            // Button to request permission
            ElevatedButton(
              onPressed: _requestContactPermission,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.saffoldBackground,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Request Contact Permission",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button to open app settings if permission is permanently denied
            if (_contactPermissionStatus.isPermanentlyDenied)
              ElevatedButton(
                onPressed: openAppSettings,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Open App Settings",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Helper function to get color based on permission status
  Color _getStatusColor(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.denied:
        return Colors.orange;
      case PermissionStatus.permanentlyDenied:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}