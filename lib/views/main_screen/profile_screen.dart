import 'package:flutter/material.dart';
import 'package:thetech_getx/constant/my_colors.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/constant/my_string.dart';
import 'package:thetech_getx/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.profileAvatar.image(height: 100),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(Assets.icons.bluePen.path),
                  color: SolidColors.seeMore,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              'فاطمه امیری',
              style: textTheme.displayLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'fatameamiri@gmail.com',
              style: textTheme.displayLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            TechDivider(size: size),
            InkWell(
              splashColor: SolidColors.primaryColor,
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavBlog,
                    style: textTheme.displayLarge,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              splashColor: SolidColors.primaryColor,
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavPodcast,
                    style: textTheme.displayLarge,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              splashColor: SolidColors.primaryColor,
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.logOut,
                    style: textTheme.displayLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
