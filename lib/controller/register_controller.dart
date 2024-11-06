import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thetech_getx/constant/api_constant.dart';
import 'package:thetech_getx/constant/my_string.dart';
import 'package:thetech_getx/components/storage_const.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/main.dart';
import 'package:thetech_getx/services/dio_services.dart';
import 'package:thetech_getx/views/main_screen/main_screen.dart';
import 'package:thetech_getx/views/register/register_intro.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeCodeTextEditingController =
      TextEditingController();
  var userId = '';
  var email = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioServices().postMethode(map, ApiUrlConstant.postRegister);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    //print(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
      'command': 'verify'
    };
    //print(map);
    var response =
        await DioServices().postMethode(map, ApiUrlConstant.postRegister);
    //print(response.data);
    var statuse = response.data['response'];

    switch (statuse) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageKey.token, response.data['token']);
        box.write(StorageKey.userId, response.data['user_id']);

        /* print(
          'READ:::::::::::: ${box.read(token)}  :::::::::::::    ${box.read(userId)}'); */

        Get.to(MainScreen());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', "کد فعال سازی غلط است");
        break;
      case 'expired':
        Get.snackbar('خطا', "کد فعال سازی منقضی شده است");
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(StorageKey.token) == null) {
      Get.offAll(RegisterIntro());
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.images.tcbot.path,
                  height: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(MyStrings.shareKnowledge)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(MyStrings.gigTech),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      //debugPrint('Go to writeArticleScreen1');
                      Get.toNamed(NameRoute.routeManageArticle);
                    },
                    child: SizedBox(
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.icons.writeArticle.path,
                            height: 32,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(MyStrings.titleAppBarManageArticle),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // debugPrint('Go to Podcast');
                    },
                    child: SizedBox(
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.icons.writePodcastIcon.path,
                            height: 32,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(MyStrings.managePodcast),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
