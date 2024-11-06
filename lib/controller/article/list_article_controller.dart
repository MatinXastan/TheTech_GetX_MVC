import 'package:get/get.dart';
import 'package:thetech_getx/constant/api_constant.dart';
import 'package:thetech_getx/models/article_model.dart';
import 'package:thetech_getx/services/dio_services.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    final response =
        await DioServices().getMethode(ApiUrlConstant.getArticleList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }

  getArticleListwithTagsId(String id) async {
    articleList.clear();
    loading.value = true;
    final response = await DioServices().getMethode(
        '${ApiUrlConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
