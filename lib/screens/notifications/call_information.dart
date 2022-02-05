import 'package:crypto_app/responsive/size_config.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/widget/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CallInformation extends StatelessWidget {
  const CallInformation({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Clipboard.setData(ClipboardData(text: value)).then(
            (_) {
              showSnackBar(context, "Copied");
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: accentColor,
                fontSize: SizeConfig.heightMultiplier * 2.5,
              ),
            ),
            Text(
              value.toUpperCase(),
              style: TextStyle(
                fontSize: SizeConfig.heightMultiplier * 2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
