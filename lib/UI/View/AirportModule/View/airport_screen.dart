import 'package:airports/UI/CustomWidgets/common_appbar.dart';
import 'package:airports/UI/CustomWidgets/custom_loading.dart';
import 'package:airports/UI/View/AirportModule/View/airport_list_data.dart';
import 'package:airports/UI/View/AirportModule/View_Model/airport_view_model.dart';
import 'package:airports/Utils/Constants/color_constants.dart';
import 'package:airports/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirportScreen extends StatelessWidget {
  AirportScreen({super.key});

  final airportViewModel = Get.find<AirportViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: commonAppBar(context, title: AppStrings.airports),
          body: Obx(
            () => airportViewModel.onError.isTrue
                ? Center(
                    child: Icon(
                      Icons.delete_outline_sharp,
                      size: 200,
                      color: AppColor().primaryColor(context),
                    ),
                  )
                : airportViewModel.isLoading.value == true
                    ? const CustomLoader()
                    : ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        physics: const BouncingScrollPhysics(),
                        itemCount: airportViewModel.airportsList.length,
                        itemBuilder: (context, index) {
                          return AirportListData(
                              airportViewModel.airportsList[index]);
                        }),
          )),
    );
  }
}
