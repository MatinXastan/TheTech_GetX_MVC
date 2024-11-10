import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thetech_getx/route_manager/binding.dart';
import 'package:thetech_getx/main.dart';
import 'package:thetech_getx/route_manager/names.dart';
import 'package:thetech_getx/views/articles_screens/manage_article.dart';
import 'package:thetech_getx/views/articles_screens/single_manage_article.dart';
import 'package:thetech_getx/views/articles_screens/single_screen.dart';
import 'package:thetech_getx/views/main_screen/main_screen.dart';
import 'package:thetech_getx/views/podcast/single_podcast.dart';
import 'package:thetech_getx/views/splash_screen.dart';

class Pages {
  Pages._();

  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NameRoute.routeMainScreen,
      page: () => MainScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: NameRoute.initialRoute,
      page: () => const SplashScreen(),
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
  ];
}
