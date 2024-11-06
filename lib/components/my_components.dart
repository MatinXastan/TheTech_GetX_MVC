import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:thetech_getx/constant/my_colors.dart';
import 'package:thetech_getx/constant/my_string.dart';
import 'package:thetech_getx/components/text_style.dart';
import 'package:thetech_getx/controller/home_screen_controller.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 0.7,
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({
    super.key,
    required this.textTheme,
    required this.index,
    /* required this.hashTagList,
    required this.whichOneIsTag, */
    /* required this.onTap, */
  });

  final TextTheme textTheme;
  final int index;
  /* final List<HashTagModel> hashTagList;
  final Enum whichOneIsTag; */
  /* Function(String) onTap; */

  @override
  Widget build(BuildContext context) {
    return /* InkWell(
      onTap: () =>
          onTap(/* whichOneIsTag == whichTags.isHashtagMain
          ? */
              tagList[index].title /*  : 'you have already selected' */),
      child:  */
        Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
        child: Row(
          children: [
            const ImageIcon(
              AssetImage('assets/icons/hashtagicon.png'),
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              //TODO برای پیدا کردن کنترلر والد
              Get.find<HomeScreenController>().tagList[index].title!,
              style: textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
    /* ); */
  }
}

class RegesterMainTags extends StatelessWidget {
  const RegesterMainTags({
    super.key,
    required this.textTheme,
    required this.index,
    /* required this.hashTagList,
    required this.whichOneIsTag, */
    /* required this.onTap, */
  });

  final TextTheme textTheme;
  final int index;
  /* final List<HashTagModel> hashTagList;
  final Enum whichOneIsTag; */
  /* Function(String) onTap; */

  @override
  Widget build(BuildContext context) {
    return /* InkWell(
      onTap: () =>
          onTap(/* whichOneIsTag == whichTags.isHashtagMain
          ? */
              tagList[index].title /*  : 'you have already selected' */),
      child:  */
        Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
        child: Row(
          children: [
            const ImageIcon(
              AssetImage('assets/icons/hashtagicon.png'),
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              //TODO برای پیدا کردن کنترلر والد
              tagList[index].title,
              style: textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
    /* ); */
  }
}

//TODO برای اینکه به یک لینکی در مرورگر بریم
myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
    );
  } else {
    log('could not launch ${uri.toString()}');
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 32,
    );
  }
}

PreferredSize appBar(String title) {
  //TODO این ویجت برای سفارشی سازی و بهترین کار برای اندازه گیری دقیق دلخواه هست که برای مثال در اپبار استفاده شده
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: Text(
                title,
                style: appBarTextStyle,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: SolidColors.primaryColor.withBlue(100),
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
    required this.title,
  });

  final double bodyMargin;
  final TextTheme textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.bluePen.path),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
