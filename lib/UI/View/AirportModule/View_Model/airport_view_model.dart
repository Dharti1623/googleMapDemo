import 'package:airports/Data/Remote/ResponseModel/airport_response_model.dart';
import 'package:airports/Network/Repository/airport_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AirportViewModel extends FullLifeCycleController {
  var airportsList = <AirportDataResponseModel>[].obs;
  var isLoading = true.obs;
  var onError = false.obs;
  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getAllAirports();
  }

  Future<void> getAllAirports() async {
    var airports = await AirportRepository.fetchAllData();
    if (kDebugMode) {
      print('airports --$airports');
    }
    if (airports.isNotEmpty) {
      isLoading.value = false;
      airportsList.value = airports;

      final airportListJson = airports.map((model) => model.toJson()).toList();
      box.write('airportData', airportListJson);
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}
