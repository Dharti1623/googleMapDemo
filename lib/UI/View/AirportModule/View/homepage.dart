import 'package:airports/Config/Services/network_manager.dart';
import 'package:airports/UI/View/AirportModule/View/airport_screen.dart';
import 'package:airports/UI/View/AirportModule/View/offline_airport_list_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final internetData = Get.find<NetworkManager>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<NetworkManager>(
          builder: (builder) => internetData.connectionType.value == 0
              ? const OfflineAirportListData()
              : AirportScreen()),
    );
  }
}
