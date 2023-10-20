import 'package:airports/Config/Services/network_manager.dart';
import 'package:airports/Data/Remote/ResponseModel/airport_response_model.dart';
import 'package:airports/UI/CustomWidgets/common_appbar.dart';
import 'package:airports/UI/View/AirportModule/View/airport_list_data.dart';
import 'package:airports/Utils/Constants/color_constants.dart';
import 'package:airports/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AirPortDetails extends StatelessWidget {
  final AirportDataResponseModel airportData;

  AirPortDetails({super.key, required this.airportData});

  late final GoogleMapController gMapController;
  final internetData = Get.find<NetworkManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          commonAppBar(context, title: airportData.name ?? 'Airport Details'),
      body: SafeArea(
        child: GetBuilder<NetworkManager>(
            builder: (builder) => internetData.connectionType.value == 0
                ? Center(
                    child: Icon(
                      Icons.signal_cellular_connected_no_internet_0_bar,
                      size: 200,
                      color: AppColor().primaryColor(context),
                    ),
                  )
                : GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    mapType: MapType.hybrid,
                    compassEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      gMapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(airportData.lat, airportData.lon),
                      zoom: 15.0,
                    ),
                    markers: {
                      Marker(
                        markerId:
                            MarkerId('${AppStrings.id_}${airportData.icao}'),
                        position: LatLng(airportData.lat, airportData.lon),
                        infoWindow: InfoWindow(
                            title: airportData.name,
                            onTap: () {
                              Get.defaultDialog(
                                title: airportData.name ?? "",
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AirportDataRow(
                                      string1:
                                          '${AppStrings.name}: ${airportData.name ?? ""}',
                                      string2:
                                          '${AppStrings.icao}: ${airportData.icao ?? ' '}',
                                    ),
                                    Text(
                                      '${AppStrings.city}: ${airportData.city ?? ""} , ${AppStrings.state}: ${airportData.state ?? ""}',
                                    ),
                                    Text(
                                      '${AppStrings.country}: ${airportData.country ?? ""}',
                                    ),
                                    Text(
                                      '${AppStrings.timeZone}: ${airportData.tz ?? ""}',
                                    ),
                                  ],
                                ),
                                contentPadding: const EdgeInsets.all(16.0),
                                textCancel: AppStrings.close,
                                titlePadding: const EdgeInsets.only(top: 8.0),
                                radius: 10.0,
                              );
                            }),
                      ),
                    },
                  )),
      ),
    );
  }
}
