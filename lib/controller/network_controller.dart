import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
// import 'package:scovoo/pages/no_internet/no_internet_page.dart';

class NetworkController extends GetxController {
  // final Connectivity _connectivity = Connectivity();
  String? previousRoute; // Keeps track of the last route

  @override
  void onInit() {
    super.onInit();
    StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.first == ConnectivityResult.none) {
        previousRoute = Get.currentRoute;
        Get.offAllNamed('/noInternet');
      } else {
        if (previousRoute != null) {
          Get.offAllNamed(previousRoute!);
        } else {
          Get.offAllNamed('/');
        }
      }
      print(result);
    });
  }
  //
  // void _updateConnectionStatus(ConnectivityResult connectivityResult) {
  //   if (connectivityResult == ConnectivityResult.none) {
  //     print('no internet ');
  //     // Get.offAll(() => NoInternetPage());
  //   } else {
  //     // Get.offAllNamed('/');
  //   }
  // }
}
