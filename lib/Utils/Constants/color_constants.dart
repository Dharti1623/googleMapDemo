import 'package:flutter/material.dart';

class AppColor {
  primaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  onPrimaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.onPrimary;
  }
}
