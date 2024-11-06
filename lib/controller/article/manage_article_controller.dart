import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thetech_getx/constant/api_constant.dart';
import 'package:thetech_getx/constant/commands.dart';
import 'package:thetech_getx/constant/my_string.dart';
import 'package:thetech_getx/components/storage_const.dart';
import 'package:thetech_getx/controller/file_controller.dart';
import 'package:thetech_getx/models/article_info_model.dart';
import 'package:thetech_getx/models/article_model.dart';
import 'package:thetech_getx/models/tags_model.dart';
import 'package:thetech_getx/services/dio_services.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagsModelList = RxList.empty();
  TextEditingController titleTextEditingController = TextEditingController();
  RxBool loading = true.obs;
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
    title: MyStrings.titltArrticle,
    content: MyStrings.editOrginalTextArticle,
    image: '',
  ).obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getManagedArticle();
  }

  getManagedArticle() async {
    loading.value = true;

    final response = await DioServices().getMethode(
        'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=published_by_me&user_id=${GetStorage().read(StorageKey.userId)}');

    /* final response = await DioServices().getMethode(
        'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=published_by_me&user_id=1'); */
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      // articleList.clear();
      loading.value = false;
    }
  }

  updateTitle() {
    articleInfoModel.update(
      (val) {
        val!.title = titleTextEditingController.text;
      },
    );
  }

  storeArticle() async {
    var fileController = Get.find<FilePickerController>();
    loading.value = true;
    Map<String, dynamic> map = {
      ApiKeyConstant.title: articleInfoModel.value.title,
      ApiKeyConstant.content: articleInfoModel.value.content,
      ApiKeyConstant.catId: articleInfoModel.value.catId,
      ApiKeyConstant.tagList: "[]",
      ApiKeyConstant.userId: GetStorage().read(StorageKey.userId),
      ApiKeyConstant.image:
          await dio.MultipartFile.fromFile(fileController.file.value.path!),
      ApiKeyConstant.command: Commands.store,
    };
    var response =
        await DioServices().postMethode(map, ApiUrlConstant.articlePost);
    log(response.data.toString());
    loading.value = false;
  }
}
