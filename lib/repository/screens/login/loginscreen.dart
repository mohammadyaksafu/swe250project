import 'package:flutter/material.dart';
import 'package:resqlink/domain/constants/appcolors.dart';
import 'package:resqlink/repository/widgets/uihelper.dart';

import '../bottomnav/bottomnavscreen.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              /** For Top Login Images */
              
              UiHelper.CustomImage(img: "loginpage.png"),
              /** Container for Logo  */
              Container(
                height: 220,
                width: 415,
                decoration: BoxDecoration(
                  color: AppColors.cardbackground,
                  borderRadius: BorderRadius.circular(20)
                ),

                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: UiHelper.CustomImage(img: "boxsizelogo.png"),
                    ),
                    SizedBox(height: 10),
                   UiHelper.CustomText(
                        text: "Your trusted companion in emergencies!",
                        color: Colors.black,
                        fontweight: FontWeight.bold,
                        fontsize: 20.0,
                        textalignment: TextAlign.center,
                        fontfamily: "bold",
                      ),

                  ],
                ),

              ),
        
        
              /*/////////////////////////
                 Container for Text  box
               ////////////////////////
               */

            /*//////////////////////////////
             A box for demo data
             //////////////////////////////
             */
        
              SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 180,
                  width: 415,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.cardbackground,
                  ),
                  child: Column(
                    /**for name*/
                    children: [
                      SizedBox(height: 5),
                      UiHelper.CustomText(
                        text: "Md Yak Safu",
                        color: Colors.black,
                        fontweight: FontWeight.w500,
                        fontsize: 15.0,
                        textalignment: TextAlign.center,
                        fontfamily: "regular",
                      ),
                      /**for phone number */
                      SizedBox(height: 5),
                      UiHelper.CustomText(
                        text: "01642468704",
                        color: Colors.black,
                        fontweight: FontWeight.w500,
                        fontsize: 15.0,
                        textalignment: TextAlign.center,
                        fontfamily: "regular",
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnavscreen()));
        
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.cardbutton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
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
      ),
    );
  }


}
