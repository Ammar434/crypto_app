import 'package:crypto_app/ressources/launch_url.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkedLabelCheckbox extends StatelessWidget {
  const LinkedLabelCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.url,
    required this.text,
  }) : super(key: key);

  final String label;
  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          activeColor: accentColor,
          value: value,
          onChanged: (bool? newValue) {
            onChanged(newValue!);
          },
        ),
        RichText(
          text: TextSpan(
            text: text,
            style: const TextStyle(color: textColor),
          ),
        ),
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              color: Colors.red,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchInBrowser(url);
              },
          ),
        ),
      ],
    );
  }
}
