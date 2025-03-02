import 'package:flutter/material.dart';
import 'package:resqlink/domain/constants/appcolors.dart';
import 'package:resqlink/repository/widgets/builddetailsbox.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* App Bar */
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: AppColors.saffoldBackground,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              print("Edit Profile");
            },
          ),
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            /* For gap between Averter and Appbar*/

            const SizedBox(height: 20),

            /*Averter  */

            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/logo.png"),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.saffoldBackground,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),

                      /*For Camera ICon */

                      child: const Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /*Gap between Averter and Name Text */
            const SizedBox(height: 10),

            /*Profile name*/

            const Text(
              "Md Yak Safu",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            /*Gap Between Email and name */
            const SizedBox(height: 5),

            /*Email in profile */
            const Text(
              "mohammadyaksafu@gmail.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            /*Gap Between email and box*/
            const SizedBox(height: 20),

            /* Usr Details */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(

                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16),
                  /*Card Information */
                  child: Column(
                    children: [
                      Detailsbox.buildDetailRow(Icons.phone, "01642468704"),
                      const Divider(),
                      Detailsbox.buildDetailRow(Icons.location_on,
                          "242/B,Salna,Gazipur Sadar, Gazipur "),
                      const Divider(),
                      Detailsbox.buildDetailRow(
                          Icons.calendar_today, "Joined January 2023"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            /*
            * Action Button
            */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Detailsbox.buildActionButton(
                    context,
                    "Edit Profile",
                    Icons.edit,
                    Colors.blue,
                        () {
                      // Add functionality for editing profile
                      print("Edit Profile");
                    },
                  ),

                  const SizedBox(height: 10),
                  Detailsbox.buildActionButton(
                    context,
                    "Change Password",
                    Icons.lock,
                    Colors.orange,
                        () {
                      print("Change Password");
                    },
                  ),
                  const SizedBox(height: 10),
                  Detailsbox.buildActionButton(
                    context,
                    "Logout",
                    Icons.logout,
                    Colors.red,
                        () {
                      print("Logout");
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}