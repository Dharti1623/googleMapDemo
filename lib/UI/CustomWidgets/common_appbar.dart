import 'package:airports/Utils/Constants/color_constants.dart';
import 'package:flutter/material.dart';

commonAppBar(BuildContext context, {required String title}) {
  return AppBar(
    title: Text(title),
    iconTheme: IconThemeData(color: AppColor().onPrimaryColor(context)),
    centerTitle: true,
    titleTextStyle:
        TextStyle(color: AppColor().onPrimaryColor(context), fontSize: 20),
    backgroundColor: Theme.of(context).primaryColor,
  );
}
