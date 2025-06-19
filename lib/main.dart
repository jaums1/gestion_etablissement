import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'Configs/Blinding/general_blinding.dart';
import 'Configs/routes/app_route.dart';
import 'Configs/routes/route.dart';
import 'Configs/utils/Constant/texte_string.dart';
import 'Configs/utils/Device/devices_utility.dart';
import 'Configs/utils/theme/theme.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as acrylic;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
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
  //     locale: Locale('fr'),
  // supportedLocales: [Locale('fr')],
  // localizationsDelegates:  [
  //      MaterialLocalizations.of(context).
  //       GlobalMaterialLocalizations.delegate,],
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


