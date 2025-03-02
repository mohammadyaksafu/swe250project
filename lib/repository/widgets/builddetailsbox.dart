import 'package:flutter/material.dart';
import 'package:resqlink/domain/constants/appcolors.dart';

class Detailsbox {
  static buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.saffoldBackground),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  static buildActionButton(BuildContext context, String text, IconData icon, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}




