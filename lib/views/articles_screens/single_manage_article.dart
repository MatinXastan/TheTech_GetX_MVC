import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:thetech_getx/components/dimens.dart';
import 'package:thetech_getx/constant/my_colors.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/constant/my_string.dart';
import 'package:thetech_getx/components/text_style.dart';
import 'package:thetech_getx/controller/article/list_article_controller.dart';
import 'package:thetech_getx/controller/article/manage_article_controller.dart';
import 'package:thetech_getx/controller/article/single_article_controller.dart';
import 'package:thetech_getx/controller/file_controller.dart';
import 'package:thetech_getx/controller/home_screen_controller.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/services/pick_file.dart';
import 'package:thetech_getx/views/articles_screens/article_content_editor.dart';
import 'package:thetech_getx/views/articles_screens/article_list_screen.dart';

// class SingleScreen extends StatefulWidget {
//   SingleScreen({super.key});

//   @override
//   State<SingleScreen> createState() => _SingleScreenState();
// }

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
/*   SingleArticleController manageArticleController =
      Get.put(SingleArticleController());
 */
  FilePickerController filePickerController = Get.put(FilePickerController());

  var manageArticleController = Get.find<ManageArticleController>();
  SingleManageArticle({super.key});
  /* @override
  void initState() {
    
    super.initState();
    // manageArticleController.getArticleInfo();
    // اینجا آیدی صفر نیست خود واقعی آیدی برمیگردونه
  } */
  getTitle() {
    Get.defaultDialog(
        title: 'عنوان مقاله',
        titleStyle: const TextStyle(
          color: SolidColors.scafoldBg,
        ),
        content: TextField(
          controller: manageArticleController.titleTextEditingController,
          style: const TextStyle(
            color: SolidColors.colorTitle,
          ),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: 'اینجا بنویس'),
        ),
        backgroundColor: SolidColors.primaryColor,
        radius: 8,
        confirm: ElevatedButton(
          onPressed: () {
            manageArticleController.updateTitle();
            Get.back();
          },
          child: const Text(
            'ثبت',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => manageArticleController.articleInfoModel.value.title == null
              ? SizedBox(height: Get.height, child: const Loading())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: Get.height / 3,
                          child: filePickerController.file.value.name ==
                                  'nothing'
                              ? CachedNetworkImage(
                                  imageUrl: manageArticleController
                                      .articleInfoModel.value.image!,
                                  imageBuilder: (context, imageProvider) =>
                                      Image(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                  placeholder: (context, url) =>
                                      const Loading(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                          Assets.images.singlePlaceHolder.path),
                                )
                              : Image.file(
                                  File(filePickerController.file.value.path!),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    end: Alignment.bottomCenter,
                                    begin: Alignment.topCenter,
                                    colors:
                                        GradientColors.singleAppbarGradiant)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: GestureDetector(
                              onTap: () async {
                                await pickFile();
                              },
                              child: Container(
                                height: 30,
                                width: Get.width / 3,
                                decoration: const BoxDecoration(
                                    color: SolidColors.primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    )),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      MyStrings.selectImage,
                                      style: textTheme.headlineMedium,
                                    ),
                                    const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        getTitle();
                      },
                      child: SeeMoreBlog(
                          bodyMargin: Dimens.halfBodyMargin,
                          textTheme: textTheme,
                          title: 'ویرایش عنوان مقاله'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimens.halfBodyMargin),
                      child: Text(
                        manageArticleController.articleInfoModel.value.title!,
                        maxLines: 2,
                        style: bigTitleTextstyle,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => ArticleContentEditor()),
                      child: SeeMoreBlog(
                        bodyMargin: Dimens.halfBodyMargin,
                        textTheme: textTheme,
                        title: 'ویرایش متن اصلی مقاله',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HtmlWidget(
                        manageArticleController.articleInfoModel.value.content!,
                        textStyle: textTheme.bodySmall,
                        enableCaching: true,
                        onLoadingBuilder: (context, element, loadingProgress) =>
                            const Loading(),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        chooseCatsBottemSheet(textTheme);
                      },
                      child: SeeMoreBlog(
                        bodyMargin: Dimens.halfBodyMargin,
                        textTheme: textTheme,
                        title: "انتخاب دسته بندی",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimens.halfBodyMargin),
                      child: Text(
                        manageArticleController
                                    .articleInfoModel.value.catName ==
                                null
                            ? 'هیچ دسته بندی انتخاب نشده'
                            : manageArticleController
                                .articleInfoModel.value.catName!,
                        maxLines: 2,
                        style: bigTitleTextstyle,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await manageArticleController.storeArticle();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(manageArticleController.loading.value
                              ? "صبر کنید"
                              : "ارسال مطلب"),
                        ))
                  ],
                ),
        ),
      ),
    ));
  }

  Widget cats(TextTheme textTheme) {
    var homeScreenController = Get.find<HomeScreenController>();
    return SizedBox(
      height: Get.height / 1.7,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeScreenController.tagList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            manageArticleController.articleInfoModel.update(
              (val) {
                val?.catId = homeScreenController.tagList[index].id!;
                val?.catName = homeScreenController.tagList[index].title!;
              },
            );

            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? 8 : 15, 8),
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: SolidColors.primaryColor),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                child: Center(
                  child: Text(
                    homeScreenController.tagList[index].title!,
                    style: textTheme.labelSmall!.apply(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }

  chooseCatsBottemSheet(TextTheme textTheme) {
    Get.bottomSheet(
      Container(
        width: Get.width,
        height: Get.height / 1.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('انتخاب دسته بندی'),
              const SizedBox(
                height: 8,
              ),
              cats(textTheme),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      persistent: true,
    );
  }
}
