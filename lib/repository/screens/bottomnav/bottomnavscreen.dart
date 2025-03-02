import 'package:flutter/material.dart';
import 'package:resqlink/repository/screens/contract/contractscreen.dart';
import 'package:resqlink/repository/screens/home/homescreen.dart';
import 'package:resqlink/repository/screens/location/locationservice.dart';
import 'package:resqlink/repository/screens/message/massegescreen.dart';
import 'package:resqlink/repository/screens/profile/profilescreen.dart';
import 'package:resqlink/repository/widgets/uihelper.dart';

class Bottomnavscreen extends StatefulWidget {
  const Bottomnavscreen({super.key});

  @override
  State<Bottomnavscreen> createState() => _BottomnavscreenState();
}

class _BottomnavscreenState extends State<Bottomnavscreen> {

  int currentIndex=0;
  List<Widget>pages=[
  HomeScreen(), MassegeScreen(),LocationServices(),ContractScreen(), ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Message",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
            label: "location"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: "Contact",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
