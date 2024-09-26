import 'package:is_app/pages/cart_design_information/binding.dart';
import 'package:is_app/pages/cart_design_information/index.dart';
import 'package:is_app/pages/category_details/binding.dart';
import 'package:is_app/pages/category_details/index.dart';
import 'package:is_app/pages/change_password/binding.dart';
import 'package:is_app/pages/change_password/index.dart';
import 'package:is_app/pages/design_details/binding.dart';
import 'package:is_app/pages/design_details/index.dart';
import 'package:is_app/pages/gallery/widgets/custom_photo_view.dart';
import 'package:is_app/pages/login/binding.dart';
import 'package:is_app/pages/login/index.dart';
import 'package:is_app/pages/main_page/binding.dart';
import 'package:is_app/pages/main_page/index.dart';
import 'package:is_app/pages/order_details/binding.dart';
import 'package:is_app/pages/order_details/index.dart';
import 'package:is_app/pages/order_history/binding.dart';
import 'package:is_app/pages/order_history/index.dart';
import 'package:is_app/pages/personal_info_details/binding.dart';
import 'package:is_app/pages/personal_info_details/index.dart';
import 'package:is_app/pages/sign_up/binding.dart';
import 'package:is_app/pages/sign_up/index.dart';
import 'package:is_app/pages/splash/binding.dart';
import 'package:is_app/pages/splash/index.dart';
import 'package:is_app/pages/styles_details/binding.dart';
import 'package:is_app/pages/styles_details/index.dart';
import 'package:get/get.dart';

abstract class AppRouting {
  static List<GetPage> routes() => [
        GetPage(
          name: Pages.splash.value,
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Pages.signUp.value,
          page: () => SignUpPage(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: Pages.login.value,
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: Pages.mainPage.value,
          page: () => MainPage(),
          binding: MainPageBinding(),
        ),
        GetPage(
          name: Pages.categoryDetails.value,
          page: () => CategoryDetailsPage(),
          binding: CategoryDetailsBinding(),
        ),
        GetPage(
          name: Pages.customPhotoView.value,
          page: () => CustomPhotoViewPage(),
          // transitionDuration: Duration(milliseconds: 700)
        ),
        GetPage(
            name: Pages.personalInfoDetails.value,
            page: () => PersonalInfoDetailsPage(),
            binding: PersonalInfoDetailsBinding()),
        GetPage(
            name: Pages.changePassword.value,
            page: () => ChangePasswordPage(),
            binding: ChangePasswordBinding()),
        GetPage(
            name: Pages.orderHistory.value,
            page: () => OrderHistoryPage(),
            binding: OrderHistoryBinding()),
        GetPage(
            name: Pages.orderDetails.value,
            page: () => OrderDetailsPage(),
            binding: OrderDetailsBinding()),
        GetPage(
            name: Pages.cartDesignInfo.value,
            page: () => CartDesignInfoPage(),
            binding: CartDesignInfoBinding()),
        GetPage(
            name: Pages.designDetails.value,
            page: () => DesignDetailsPage(),
            binding: DesignDetailsBinding()),
        GetPage(
            name: Pages.stylesDetails.value,
            page: () => StylesDetailsPage(),
            binding: StylesDetailsBinding()),
      ];
}

enum Pages {
  splash,
  signUp,
  login,
  mainPage,
  categoryDetails,
  customPhotoView,
  personalInfoDetails,
  changePassword,
  orderHistory,
  orderDetails,
  cartDesignInfo,
  designDetails,
  stylesDetails
}

extension PagesExtension on Pages {
  String get value {
    switch (this) {
      case Pages.splash:
        return '/';
      case Pages.signUp:
        return '/signUp';
      case Pages.login:
        return '/login';
      case Pages.mainPage:
        return '/mainPage';
      case Pages.categoryDetails:
        return '/categoryDetails';
      case Pages.customPhotoView:
        return '/customPhotoView';
      case Pages.personalInfoDetails:
        return '/personalInfoDetails';
      case Pages.changePassword:
        return '/changePassword';
      case Pages.orderHistory:
        return '/orderHistory';
      case Pages.orderDetails:
        return '/orderDetails';
      case Pages.cartDesignInfo:
        return '/cartDesignInfo';
      case Pages.designDetails:
        return '/designDetails';
      case Pages.stylesDetails:
        return '/stylesDetails';
      default:
        throw 'unnamed route';
    }
  }
}

abstract class Navigation {
  static Pages? getPage(String route) {
    switch (route) {
      case '/':
        return Pages.splash;
      case '/signUp':
        return Pages.signUp;
      case '/login':
        return Pages.login;
      case '/mainPage':
        return Pages.mainPage;
      case '/categoryDetails':
        return Pages.categoryDetails;
      case '/customPhotoView':
        return Pages.customPhotoView;
      case '/personalInfoDetails':
        return Pages.personalInfoDetails;
      case '/changePassword':
        return Pages.changePassword;
      case '/orderHistory':
        return Pages.orderHistory;
      case '/orderDetails':
        return Pages.orderDetails;
      case '/cartDesignInfo':
        return Pages.cartDesignInfo;
      case '/designDetails':
        return Pages.designDetails;
      case '/stylesDetails':
        return Pages.stylesDetails;
      default:
        return null;
    }
  }
}
