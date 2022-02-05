import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.heightMultiplier * 2),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      backgroundColor: accentColor,
      duration: const Duration(milliseconds: 750),
    ),
  );
}
