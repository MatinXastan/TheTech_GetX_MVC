import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:thetech_getx/components/decorations.dart';
import 'package:thetech_getx/components/dimens.dart';
import 'package:thetech_getx/constant/my_colors.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/constant/my_string.dart';
import 'package:thetech_getx/controller/register_controller.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/views/main_screen/home_screen.dart';
import 'package:thetech_getx/views/main_screen/profile_screen.dart';
import 'package:thetech_getx/views/register/register_intro.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(237, 255, 255, 255),
          child: Padding(
            padding: EdgeInsets.only(
                left: Dimens.bodyMargin, right: Dimens.bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.splash.path,
                      scale: 3,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    MyStrings.userProfile,
                    style: textTheme.labelSmall,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    MyStrings.aboutTec,
                    style: textTheme.labelSmall,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    MyStrings.shareTec,
                    style: textTheme.labelSmall,
                  ),
                  onTap: () async {
                    //TODO برای اشتراک گزاری متنی که ما میخوایم در برنامه های دیگه
                    await Share.share(MyStrings.shareText);
                  },
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    MyStrings.tecIngithub,
                    style: textTheme.labelSmall,
                  ),
                  onTap: () {
                    myLaunchUrl(MyStrings.techBlogGithubUrl);
                  },
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColors.scafoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Assets.images.splash.image(height: Dimens.size.height / 13.6),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(
                      size: Dimens.size,
                      textTheme: textTheme,
                      bodyMargin: Dimens.bodyMargin),
                  ProfileScreen(
                      size: Dimens.size,
                      textTheme: textTheme,
                      bodyMargin: Dimens.bodyMargin),
                ],
              ),
            )),
            ButtomNavigation(
              size: Dimens.size,
              bodyMargin: Dimens.bodyMargin,
              changeScreen: (int value) {
                selectedPageIndex.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtomNavigation extends StatelessWidget {
  ButtomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColors.bottomNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: bodyMargin,
            left: bodyMargin,
          ),
          child: Container(
            height: size.height / 8,
            width: size.width,
            decoration: MyDecorations.mainGradiant,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => changeScreen(0),
                    icon: ImageIcon(
                      AssetImage(
                        Assets.icons.home.path,
                      ),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      Get.find<RegisterController>().toggleLogin();
                    },
                    icon: ImageIcon(
                      AssetImage(
                        Assets.icons.write.path,
                      ),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: ImageIcon(
                      AssetImage(
                        Assets.icons.user.path,
                      ),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
