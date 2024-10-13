import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thetech_getx/components/my_colors.dart';
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
  MainTags({
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
