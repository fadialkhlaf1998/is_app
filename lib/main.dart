import 'package:is_app/initial_binding.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  TabbySDK().setup(
    withApiKey: '',
    // environment: Environment.production,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      initialBinding: InitialBinding(),
      // title: AppConstant.applicationName,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist',
        useMaterial3: false,
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(color: primaryColor),
      ),
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: _localeCode,
      getPages: AppRouting.routes(),
      initialRoute: '/',
    );
  }
}
