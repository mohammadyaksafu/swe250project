import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:resqlink/domain/constants/appcolors.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationServices extends StatefulWidget {
  const LocationServices({super.key});

  @override
  State<LocationServices> createState() => _LocationServicesState();
}

class _LocationServicesState extends State<LocationServices> {
  TextEditingController phoneController = TextEditingController();

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log("Location services are disabled.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      log("Location Permission Denied");
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        log("Location Permission Denied Permanently");
        return;
      }
    }

    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    log("Latitude = ${currentPosition.latitude}");
    log("Longitude = ${currentPosition.longitude}");

    String latitude = currentPosition.latitude.toString();
    String longitude = currentPosition.longitude.toString();
    String phoneNumber = phoneController.text.trim();

    if (phoneNumber.isEmpty) {
      log("Phone number is empty!");
      return;
    }

    String message = "Here is my location: https://maps.google.com/?q=$latitude,$longitude";

    Uri smsUri = Uri.parse("sms:$phoneNumber?body=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      log("Could not launch SMS");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
        backgroundColor: AppColors.saffoldBackground,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.saffoldBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type Number here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                getCurrentLocation(); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.saffoldBackground,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                "Send Location",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
