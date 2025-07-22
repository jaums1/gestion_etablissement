import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as acrylic;
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Configs/Blinding/general_blinding.dart';
import 'Configs/Translations/translations.dart';
import 'Configs/routes/app_route.dart';
import 'Configs/routes/route.dart';
import 'Configs/utils/Constant/texte_string.dart';
import 'Configs/utils/Device/devices_utility.dart';
import 'Configs/utils/theme/theme.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
 await initializeDateFormatting('fr_FR',null);
  Intl.defaultLocale='fr_FR';
  await windowManager.ensureInitialized();  
  await acrylic.Window.initialize();
  await acrylic.Window.setEffect(
    effect: acrylic.WindowEffect.transparent,
    dark: false,
  );
 
  runApp(const MyApp());
  TDeviceUtility.isDesktop()==true? doWhenWindowReady((){
  final initialSize = Size(400, 570);
       appWindow.size = initialSize;
       appWindow.alignment = Alignment.center;
       
 }):null;
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: const Locale('fr'),
      fallbackLocale: const Locale('en'),
       localizationsDelegates:  [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
      ],

      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      title: TText.appName,
      initialBinding: TGeneralBinding(),
      getPages: TAppRoute.page,
      initialRoute: TRoutes.login,
    );
  }
}


