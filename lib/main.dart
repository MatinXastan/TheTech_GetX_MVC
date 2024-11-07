import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thetech_getx/binding.dart';
import 'package:thetech_getx/constant/my_colors.dart';
import 'package:thetech_getx/my_http_overrides.dart';
import 'package:thetech_getx/views/articles_screens/html_content_eitor.dart';
import 'package:thetech_getx/views/articles_screens/manage_article.dart';
import 'package:thetech_getx/views/articles_screens/single_manage_article.dart';
import 'package:thetech_getx/views/main_screen/main_screen.dart';
import 'package:thetech_getx/views/articles_screens/single_screen.dart';
import 'package:thetech_getx/views/podcast/single_podcast.dart';
import 'package:thetech_getx/views/splash_screen.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statuseBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //TODO دیگه برای هر اسکرین میتونیم بایندینگ انجام بدیم با استفاده از getPage:
      //initialBinding: RegisterBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: const Locale('fa'),
      theme: lightThemeData(),
      /* localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // English
      ], */
      // home: const SplashScreen(),
      //home: SingleScreen(),
      getPages: [
        GetPage(
          name: NameRoute.routeMainScreen,
          page: () => MainScreen(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: NameRoute.routeSingleArticle,
          page: () => SingleScreen(),
          binding: ArticleBinding(),
        ),
        GetPage(
          name: NameRoute.routeManageArticle,
          page: () => ManageArticle(),
          binding: ArticleManagerBinding(),
        ),
        GetPage(
          name: NameRoute.routeSingleManageArticle,
          page: () => SingleManageArticle(),
          binding: ArticleManagerBinding(),
        ),
        GetPage(
          name: NameRoute.routeSinglePodcast,
          page: () => PodcastSingle(),
        ),
      ],
      home: SplashScreen(),
      // home: SinglePodcast(),
    );
  }

  ThemeData lightThemeData() {
    return ThemeData(
      fontFamily: 'dana',
      brightness: Brightness.light,
      /* accentColor: SolidColors.primaryColor, */
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return const TextStyle(
                  fontSize: 25,
                );
              } else {
                return const TextStyle(
                  fontSize: 20,
                );
              }
            },
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return SolidColors.seeMore;
              } else {
                return SolidColors.primaryColor;
              }
            },
          ),
        ),
      ),
      textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: SolidColors.posterTitle,
          ),
          //subtitle1
          titleLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubTitle,
          ),
          //bodytext1
          bodyLarge: TextStyle(
              fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
          headlineMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: SolidColors.seeMore,
            fontWeight: FontWeight.w700,
          ),
          //headline4
          displayLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Color.fromARGB(255, 70, 70, 70),
            fontWeight: FontWeight.w700,
          ),
          //headline5
          labelSmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: Colors.black,
              // color: SolidColors.hintTextColor,
              fontWeight: FontWeight.w700)),

      /* const TextTheme(
        displayLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black),
        /* titleMedium:  TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubTitle), */
        bodyLarge: TextStyle(
            fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
        displayMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w300),
        /* displaySmall: const TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: SolidColors.seeMore,
            fontWeight: FontWeight.w700), */
        headlineMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: Color.fromARGB(255, 70, 70, 70),
            fontWeight: FontWeight.w700),
        headlineSmall: const TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: SolidColors.hintText,
            fontWeight: FontWeight.w700),
            
      ), */
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}

class NameRoute {
  NameRoute._();
  static String routeMainScreen = '/MainScreen';
  static String routeSingleArticle = '/SingleArticle';
  static String routeSingleManageArticle = '/SingleManageArticle';
  static String routeSinglePodcast = '/routeSinglePodcast';
  static String routeManageArticle = '/ManageArticle';
}
