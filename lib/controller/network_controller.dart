// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
// // import 'package:scovoo/pages/no_internet/no_internet_page.dart';
//
// class NetworkController extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }
//
//   void _updateConnectionStatus(ConnectivityResult connectivityResult) {
//     if (connectivityResult == ConnectivityResult.none) {
//       print('no internet ');
//       // Get.offAll(() => NoInternetPage());
//     } else {
//       // Get.offAllNamed('/');
//     }
//   }
// }
