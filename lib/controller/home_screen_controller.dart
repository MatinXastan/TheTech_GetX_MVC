import 'package:get/get.dart';
import 'package:thetech_getx/constant/api_constant.dart';
import 'package:thetech_getx/models/article_model.dart';
import 'package:thetech_getx/models/podcast_model.dart';
import 'package:thetech_getx/models/poster_model.dart';
import 'package:thetech_getx/models/tags_model.dart';
import 'package:thetech_getx/services/dio_services.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioServices().getMethode(ApiUrlConstant.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPodcasts.add(PodcastModel.fromJson(element));
      });

      response.data['tags'].forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);
      loading.value = false;
    }
  }
}
