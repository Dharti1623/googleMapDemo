import 'package:airports/Data/Remote/ResponseModel/airport_response_model.dart';
import 'package:airports/UI/CustomWidgets/common_appbar.dart';
import 'package:airports/UI/View/AirportModule/View/airport_list_data.dart';
import 'package:airports/Utils/Constants/color_constants.dart';
import 'package:airports/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class OfflineAirportListData extends StatefulWidget {
  const OfflineAirportListData({super.key});

  @override
  State<OfflineAirportListData> createState() => _OfflineAirportListDataState();
}

class _OfflineAirportListDataState extends State<OfflineAirportListData> {
  List<dynamic> airportsList = [];
  final box = GetStorage();

  @override
  void initState() {
    airportsList = getAirportDataList();
    super.initState();
  }

  List<AirportDataResponseModel> getAirportDataList() {
    final airportListJson = box.read('airportData');
    if (airportListJson != null) {
      final airportList = (airportListJson as List)
          .map((item) => AirportDataResponseModel.fromJson(item))
          .toList();
      return airportList;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBar(context, title: AppStrings.airportsOffline),
        body: airportsList.isEmpty || airportsList == []
            ? Center(
                child: Icon(
                  Icons.delete_outline_sharp,
                  size: 200,
                  color: AppColor().primaryColor(context),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                physics: const BouncingScrollPhysics(),
                itemCount: airportsList.length,
                itemBuilder: (context, index) {
                  return AirportListData(airportsList[index]);
                }),
      ),
    );
  }
}
