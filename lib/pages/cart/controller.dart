import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/models/body/cart/cart_id_body.dart';
import 'package:is_app/data/models/response/cart/cart_response.dart';
import 'package:is_app/data/models/response/guest/design_details_response.dart';
import 'package:is_app/data/repository/cart_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final InitController initController = Get.find();

  CartRepo cartRepo = CartRepo();
  CartResponse myCart = CartResponse();
  Cart cartDesignDetails = Cart();

  RxList<Cart> cartList = <Cart>[].obs;

  RxBool loading = false.obs;
  RxBool loadingRemove = false.obs;
  RxBool loadingCheck = false.obs;

  RxInt cartIndexDelete = (-1).obs;

  getCartRequest() async {
    if (initController.checkUserIfLogin()) {
      cartList.clear();
      loading.value = true;
      await cartRepo.getCart().then((value) {
        if (value.code == 1) {
          cartList.addAll((value.data['cart'] as List)
              .map((e) => Cart.fromJson(e))
              .toList());
          myCart = CartResponse.fromJson(value.data);
          loading.value = false;
        } else {
          loading.value = false;
        }
      });
    }
  }

  removeDesignFromCartRequest(BuildContext context, index) async {
    if (!loadingRemove.value) {
      loadingRemove.value = true;
      cartIndexDelete.value = index;
      cartRepo
          .deleteFromCart(CartIdBody(id: cartList[index].cartId))
          .then((value) async {
        if (value.code == 1) {
          loadingRemove.value = false;
          cartIndexDelete.value = -1;
          await getCartRequest();
          print('success');
        } else {
          cartIndexDelete.value = -1;
          loadingRemove.value = false;
          print('wrong');
        }
      });
    }
  }

  getCartItemDetails(index) {
    cartDesignDetails = cartList[index];
  }

  getCartItemDetailsFromDesign(DesignResponse designResponse, int cartId) {
    cartDesignDetails = Cart(
      cartId: cartId,
      width: 0,
      height: 0,
      length: 0,
      files: Files(
        corner1: "",
        corner2: "",
        corner3: "",
        corner4: "",
        dwg: "",
        pdf: ""
      ),
      note: "",
      designId: designResponse.designId,
      accountId: -1,
      title: designResponse.title,
      arTitle: designResponse.arTitle,
      images: designResponse.images,
      description: designResponse.description,
      arDescription: designResponse.arDescription,
      categoryId: designResponse.categoryId,
        styleId: designResponse.styleId,
      price: designResponse.price,
        category: designResponse.category,
        arCategory: designResponse.arCategory,
        style: designResponse.style,
        arStyle: designResponse.arStyle,
        stringFiles: "{\"corner_1\":\"\",\"corner_2\":\"\",\"corner_3\":\"\",\"corner_4\":\"\",\"pdf\":\"\",\"dwg\":\"\"}",
    );
  }

  checkoutRequest(BuildContext context) async {
    loadingCheck.value = true;
    await cartRepo.checkout().then((value) async {
      if(value.code == 1){
        TopSnackBar.success(context, 'Done');
        loadingCheck.value = false;
        await getCartRequest();
      }else{
        loadingCheck.value = false;
        TopSnackBar.warning(context, context.localizations.something_wrong);
      }
    });
  }
  alwaysCheckoutRequestToDone() async {
    loadingCheck.value = true;
    await cartRepo.checkout().then((value) async {
      if(value.code == 1){
        loadingCheck.value = false;
        await getCartRequest();
        return;
      }else{
        loadingCheck.value = false;
        return await alwaysCheckoutRequestToDone();
      }
    });
  }
}