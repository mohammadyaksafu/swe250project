import 'package:flutter/material.dart';
import 'package:resqlink/repository/screens/contract/contractscreen.dart';
import 'package:resqlink/repository/screens/home/homescreen.dart';
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
  HomeScreen(), MassegeScreen(), ContractScreen(), ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon:
        UiHelper.CustomImage(img: "homeicon.png"),label: "Home"
        ),
        BottomNavigationBarItem(icon:
        UiHelper.CustomImage(img: "massegeicon.png"),label: "Massege"
        ),
        BottomNavigationBarItem(icon:
        UiHelper.CustomImage(img: "phoneicon.png"),label: "Contact"
        ),
        BottomNavigationBarItem(icon:
        UiHelper.CustomImage(img: "accounicont.png"),label: "Profile"
        ),

      ],type: BottomNavigationBarType.fixed, currentIndex: currentIndex,onTap:(index){
        setState(() {
          currentIndex =index;

        });
      },),
    );
  }
}
