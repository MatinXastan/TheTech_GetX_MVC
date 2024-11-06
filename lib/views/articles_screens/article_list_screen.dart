import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thetech_getx/binding.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/controller/article/list_article_controller.dart';
import 'package:thetech_getx/controller/article/single_article_controller.dart';
import 'package:thetech_getx/main.dart';
import 'package:thetech_getx/views/articles_screens/single_screen.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  String titleAppBar;
  ArticleListScreen(this.titleAppBar, {super.key});
  ListArticleController listArticleController =
      Get.put(ListArticleController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(titleAppBar),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Obx(
              () => !singleArticleController.loading.value
                  ? ListView.builder(
                      itemCount: listArticleController.articleList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            /*  singleArticleController.id.value = int.parse(
                          listArticleController.articleList[index].id!);
                      Get.to(
                        SingleScreen(),
                      ); */
                            await singleArticleController.getArticleInfo(
                                listArticleController.articleList[index].id!);

                            Get.toNamed(NameRoute.routeSingleArticle);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width / 3,
                                  height: Get.height / 6,
                                  child: CachedNetworkImage(
                                    imageUrl: listArticleController
                                        .articleList[index].image!,
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      );
                                    },
                                    placeholder: (context, url) =>
                                        const Loading(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        listArticleController
                                            .articleList[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          listArticleController
                                              .articleList[index].author!,
                                          style: textTheme.bodySmall,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "${listArticleController.articleList[index].view!} بازدید ",
                                          style: textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Loading(),
            ),
          ),
        ),
      ),
    );
  }
}
