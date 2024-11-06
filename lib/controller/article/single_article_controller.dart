import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:thetech_getx/constant/api_constant.dart';
import 'package:thetech_getx/models/article_info_model.dart';
import 'package:thetech_getx/models/article_model.dart';
import 'package:thetech_getx/models/tags_model.dart';
import 'package:thetech_getx/services/dio_services.dart';
import 'package:thetech_getx/views/articles_screens/single_screen.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagsModelList = RxList();
  RxList<ArticleModel> relatedList = RxList();
  //articleModel && tagsModel

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    loading.value = true;
    //TODO user id is hard code
    var userId = '';
    var adrress =
        "${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId";
    final response = await DioServices().getMethode(adrress);
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      tagsModelList.clear();
      response.data['tags'].forEach((element) {
        tagsModelList.add(TagsModel.fromJson(element));
      });
      relatedList.clear();
      response.data['related'].forEach((element) {
        relatedList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
      // Get.to(SingleScreen());
    }
  }
}
