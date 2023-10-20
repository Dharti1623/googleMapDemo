import 'package:airports/Utils/Constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            CircularProgressIndicator(color: AppColor().primaryColor(context)));
  }
}
