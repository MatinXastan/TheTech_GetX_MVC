import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/constant/my_string.dart';
import 'package:thetech_getx/controller/article/manage_article_controller.dart';
import 'package:thetech_getx/controller/register_controller.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/main.dart';
import 'package:thetech_getx/route_manager/names.dart';
import 'package:thetech_getx/views/my_cats.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});
  // RegisterController registerController = Get.put(RegisterController());
  // var registerController = Get.find<RegisterController>();
  var articleManageController = Get.find<ManageArticleController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 16, left: 8, right: 8),
          child: ElevatedButton(
              style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(Size(Get.width / 3, 56))),
              onPressed: () {
                Get.toNamed(NameRoute.routeSingleManageArticle);
              },
              child: Text(
                MyStrings.textManageArticle,
                style: const TextStyle(color: Colors.white),
              )),
        ),
        appBar: appBar('مدیریت مقاله ها'),
        body: Obx(
          () => articleManageController.loading == true
              ? Loading()
              : articleManageController.articleList.isNotEmpty
                  ? ListView.builder(
                      itemCount: articleManageController.articleList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            /*  singleArticleController.id.value = int.parse(
                          articleManageController.articleList[index].id!);
                      Get.to(
                        SingleScreen(),
                      ); */
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
                                    imageUrl: articleManageController
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
                                        articleManageController
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
                                          articleManageController
                                              .articleList[index].author!,
                                          style: textTheme.bodySmall,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "${articleManageController.articleList[index].view!} بازدید ",
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
                  : articleEmptyState(textTheme),
        ),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.emptyState.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            //TODO rechText
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.articleEmpty,
                    style: textTheme.displayLarge)),
          ),
        ],
      ),
    );
  }
}
