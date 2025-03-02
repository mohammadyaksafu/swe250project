import 'package:flutter/material.dart';
import 'package:resqlink/domain/constants/appcolors.dart';
class PredifenedMasseges {

  static buildPredefinedMessageButton(String message, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),

      child: OutlinedButton(
        onPressed: () {
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
        },

        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.saffoldBackground),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 16, color: AppColors.saffoldBackground),
        ),
      ),
    );
  }




}
