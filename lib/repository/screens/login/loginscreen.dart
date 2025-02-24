import 'package:flutter/material.dart';
import 'package:resqlink/repository/widgets/uihelper.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            /** For Top Login Images */
            UiHelper.CustomImage(img: "loginpage.png"),

            /** Container for Logo  */
            Container(
              height: 100,
              width: 415,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: UiHelper.CustomImage(img: "boxsizelogo.png"),
              ),
            ),

            /** */
            Container(
              height: 150,
              width: 415,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20),
              child: UiHelper.CustomText(
                text: "Your trusted companion in emergencies!",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 20.0,
                textalignment: TextAlign.center,
                fontfamily: "bold",
              ),
            ),

            SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    UiHelper.CustomText(
                      text: "Md Yak Safu",
                      color: Colors.black,
                      fontweight: FontWeight.w500,
                      fontsize: 15.0,
                      textalignment: TextAlign.center,
                      fontfamily: "regular",
                    ),
                    SizedBox(height: 10),
                    UiHelper.CustomText(
                      text: "01642468704",
                      color: Colors.black,
                      fontweight: FontWeight.w500,
                      fontsize: 15.0,
                      textalignment: TextAlign.center,
                      fontfamily: "regular",
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            UiHelper.CustomText(
                              text: "Login With",
                              color: Colors.black,
                              fontweight: FontWeight.w500,
                              fontsize: 15.0,
                              textalignment: TextAlign.left,
                              fontfamily: "bold",
                            ),
                            Container(
                              height: 40,
                              width: 80,
                              padding: EdgeInsets.all(10),
                              child: UiHelper.CustomImage(
                                img: "googleimageremovebg.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    UiHelper.CustomText(
                      text: "Login with Phone Number",
                      color: Colors.blue,
                      fontweight: FontWeight.bold,
                      fontsize: 20.0,
                      textalignment: TextAlign.center,
                      fontfamily: "regular",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
