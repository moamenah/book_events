import 'package:book_events/ui/home/home.dart';
import 'package:book_events/utils/app_routes.dart';
import 'package:book_events/utils/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp( EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      saveLocale: false, // ✅ عشان ما يحفظش آخر لغة
      startLocale: Locale("en"),
      fallbackLocale: Locale('en'),
      child: MyApp()
  ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
     // themeMode: ,




      debugShowCheckedModeBanner: false,
initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName:(context)=>Home(),
      },
    );
  }
}
