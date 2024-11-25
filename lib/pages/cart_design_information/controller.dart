import 'dart:io';
import 'package:is_app/data/models/body/cart/cart_body.dart';
import 'package:is_app/data/models/response/cart/cart_response.dart';
import 'package:is_app/data/repository/cart_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CartDesignInfoController extends GetxController {
  final CartController cartController = Get.find();

  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  Cart cartDesignDetails = Cart();
  Cart cartDesignDetailsStatic = Cart();

  RxBool loading = false.obs;
  RxBool sameData = false.obs;
  RxBool sameFile = true.obs;

  RxInt chosenImageIndex = (-1).obs;

  CartRepo cartRepo = CartRepo();

  RxBool imageChosePopUp = false.obs;

  List<String> attachMediaImageList = [
    CAM1,
    CAM2,
    CAM3,
    CAM4,
    PDF_ICON,
    DWG_ICON
  ];

  Rx<File> corner1 = File('').obs;
  Rx<File> corner2 = File('').obs;
  Rx<File> corner3 = File('').obs;
  Rx<File> corner4 = File('').obs;
  Rx<File> pdfMedia = File('').obs;
  Rx<File> dwgMedia = File('').obs;

  @override
  void onInit() {
    cartDesignDetails = cartController.cartDesignDetails.clone();
    cartDesignDetailsStatic = cartController.cartDesignDetails.clone();
    fillTextFields();
    checkChange();
    super.onInit();
    // fillMedia();
  }

  fillTextFields() {
    widthController = TextEditingController(
        text: cartDesignDetails.width.toString() == '0.0'
            ? ''
            : cartDesignDetails.width.toString());
    heightController = TextEditingController(
        text: cartDesignDetails.height.toString() == '0.0'
            ? ''
            : cartDesignDetails.height.toString());
    lengthController = TextEditingController(
        text: cartDesignDetails.length.toString() == '0.0'
            ? ''
            : cartDesignDetails.length.toString());
    noteController =
        TextEditingController(text: cartDesignDetails.note.toString());
  }

  checkChange() {
    sameData.value = (cartDesignDetails == cartDesignDetailsStatic);
    print('change =====> ${sameData.value}');
    return sameData.value;
  }

  updateCartRequest(BuildContext context) async {
    loading.value = true;
    cartRepo
        .editCart(CartBody(
            id: cartDesignDetails.cartId.toString(),
            width: cartDesignDetails.width,
            height: cartDesignDetails.height,
            length: cartDesignDetails.length,
            note: cartDesignDetails.note,
            corner1: corner1.value.path == '' ? null : corner1.value,
            corner2: corner2.value.path == '' ? null : corner2.value,
            corner3: corner3.value.path == '' ? null : corner3.value,
            corner4: corner4.value.path == '' ? null : corner4.value,
            pdf: pdfMedia.value.path == '' ? null : File(pdfMedia.value.path),
            dwg: dwgMedia.value.path == '' ? null : File(dwgMedia.value.path)))
        .then((value) async {
      if (value.code == 1) {
        loading.value = false;
        Get.back();
        await cartController.getCartRequest();
      } else {
        loading.value = false;
        TopSnackBar.warning(context, context.localizations.something_wrong);
      }
    });
  }

  Future getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    switch (chosenImageIndex.value) {
      case 1:
        corner1.value = File(image!.path);
        sameFile.value = false;
        imageChosePopUp.value = false;
        break;
      case 2:
        corner2.value = File(image!.path);
        sameFile.value = false;
        imageChosePopUp.value = false;
        break;
      case 3:
        corner3.value = File(image!.path);
        sameFile.value = false;
        imageChosePopUp.value = false;
        break;
      case 4:
        corner4.value = File(image!.path);
        sameFile.value = false;
        imageChosePopUp.value = false;
        break;
    }
  }

  Future getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    switch (chosenImageIndex.value) {
      case 1:
        corner1.value = File(image!.path);
        sameFile.value = false;
        imageChosePopUp.value = false;
        break;
      case 2:
        corner2.value = File(image!.path);
        sameFile.value = false;
        imageChosePopUp.value = false;
        break;
      case 3:
        corner3.value = File(image!.path);
        sameFile.value = false;
        imageChosePopUp.value = false;
        break;
      case 4:
        corner4.value = File(image!.path);
        sameFile.value = false;
        imageChosePopUp.value = false;
        break;
    }
  }

  openImageOptions(index) {
    chosenImageIndex.value = index;
    imageChosePopUp.value = true;
  }

  Future<void> pickFile(index) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      PlatformFile file = result.files.first;
      print('--------------');
      print(file.path);
      print('--------------');
      switch (index) {
        case 1:
          pdfMedia.value = File(file.path!);
          sameFile.value = false;
          break;
        case 2:
          dwgMedia.value = File(file.path!);
          sameFile.value = false;
          break;
      }
      print(pdfMedia.value.path);
    } else {
      print('User canceled the picker');
    }
  }
}
