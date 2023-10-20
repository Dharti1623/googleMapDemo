import 'package:airports/Data/Remote/ResponseModel/airport_response_model.dart';
import 'package:airports/UI/View/AirportModule/View/airport_detail_page.dart';
import 'package:airports/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirportListData extends StatelessWidget {
  final AirportDataResponseModel airportData;

  const AirportListData(this.airportData, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => AirPortDetails(airportData: airportData)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AirportDataRow(
                    string1: '${AppStrings.name} : ${airportData.name ?? ''}',
                    string2: airportData.icao ?? ""),
                AirportDataRow(
                    string1: '${airportData.city}, ${airportData.state}',
                    string2: airportData.country ?? ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AirportDataRow extends StatelessWidget {
  final String string1, string2;

  const AirportDataRow(
      {super.key, required this.string1, required this.string2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(string1),
          Text(string2),
        ],
      ),
    );
  }
}
