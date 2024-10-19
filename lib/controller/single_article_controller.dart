import 'package:get/get.dart';
import 'package:thetech_getx/components/api_constant.dart';
import 'package:thetech_getx/models/article_info_model.dart';
import 'package:thetech_getx/models/article_model.dart';
import 'package:thetech_getx/models/tags_model.dart';
import 'package:thetech_getx/services/dio_services.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagsModelList = RxList();
  RxList<ArticleModel> articleModelList = RxList();
  //articleModel && tagsModel
  @override
  onInit() {
    super.onInit();
  }

  getArticleInfo() async {
    loading.value = true;
    //TODO user id is hard code
    var userId = '';
    var adrress =
        "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId";
    final response = await DioServices().getMethode(adrress);
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      tagsModelList.clear();
      response.data['tags'].forEach((element) {
        tagsModelList.add(TagsModel.fromJson(element));
      });
      articleModelList.clear();
      response.data['related'].forEach((element) {
        articleModelList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
