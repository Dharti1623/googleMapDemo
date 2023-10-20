import 'package:airports/Config/Services/network_manager.dart';
import 'package:airports/UI/View/AirportModule/View_Model/airport_view_model.dart';
import 'package:get/get.dart';

class NetworkBinding extends Bindings {
  NetworkBinding();

  @override
  void dependencies() {
    Get.lazyPut<AirportViewModel>(() => AirportViewModel(), fenix: true);
    Get.lazyPut<NetworkManager>(() => NetworkManager());
  }
}
