import 'package:get/get.dart';
import 'package:is_app/res/images.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsController extends GetxController {
  List<String> contactEnTitle = ['Phone', 'Whatsapp'];

  List<String> contactArTitle = ['اتصال', 'واتساب'];

  List<String> contactIcons = [
    PHONE_ICON,
    WHATSAPP_ICON,
  ];

  pressOnContactSection(index) {
    switch (index) {
      case 0:
        openPhone('+966544800211');
        break;
      case 1:
        openWhatsApp('+966544800211');
        break;
    }
  }

  Future<void> openWhatsApp(String phoneNumber) async {
    final whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not open WhatsApp";
    }
  }

  Future<void> openPhone(String phoneNumber) async {
    final phoneUrl = Uri.parse("tel:$phoneNumber");

    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    } else {
      throw "Could not open Phone app";
    }
  }
}
