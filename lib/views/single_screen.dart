import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:thetech_getx/components/my_colors.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/components/text_style.dart';
import 'package:thetech_getx/controller/list_article_controller.dart';
import 'package:thetech_getx/controller/single_article_controller.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/models/fake_data.dart';
import 'package:thetech_getx/views/main_screen/article_list_screen.dart';

class SingleScreen extends StatefulWidget {
  SingleScreen({super.key});

  @override
  State<SingleScreen> createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleArticleController.getArticleInfo();
    // اینجا آیدی صفر نیست خود واقعی آیدی برمیگردونه
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => singleArticleController.articleInfoModel.value.title == null
              ? Loading()
              : singleArticleController.loading.value
                  ? Loading()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: singleArticleController
                                  .articleInfoModel.value.image!,
                              imageBuilder: (context, imageProvider) =>
                                  Image(image: imageProvider),
                              placeholder: (context, url) => const Loading(),
                              errorWidget: (context, url, error) => Image.asset(
                                  Assets.images.singlePlaceHolder.path),
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
                                        colors: GradientColors
                                            .singleAppbarGradiant)),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.bookmark_border_rounded,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            singleArticleController
                                .articleInfoModel.value.title!,
                            maxLines: 2,
                            style: bigTitleTextstyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image(
                                image: Image.asset(
                                  Assets.images.profileAvatar.path,
                                ).image,
                                height: 50,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                singleArticleController
                                    .articleInfoModel.value.author!,
                                style: textTheme.displayLarge,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                singleArticleController
                                    .articleInfoModel.value.createdAt!,
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HtmlWidget(
                            singleArticleController
                                .articleInfoModel.value.content!,
                            textStyle: textTheme.bodySmall,
                            enableCaching: true,
                            onLoadingBuilder:
                                (context, element, loadingProgress) =>
                                    const Loading(),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: testTagsSingleScreen(textTheme),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "نوشته های مرتبط",
                              style: textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        testDirectionPostSingleScreen(size, textTheme)
                      ],
                    ),
        ),
      ),
    ));
  }

  SizedBox testDirectionPostSingleScreen(Size size, TextTheme textTheme) {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: singleArticleController.articleModelList.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? 8 : 15),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 5.3,
                    width: Get.width / 2.4,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: GradientColors.blogPost)),
                          child: CachedNetworkImage(
                            imageUrl: singleArticleController
                                .articleModelList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) => const Loading(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                singleArticleController
                                    .articleModelList[index].author!,
                                style: textTheme.titleLarge,
                              ),
                              Row(
                                children: [
                                  Text(
                                    singleArticleController
                                        .articleModelList[index].view!,
                                    style: textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      singleArticleController.articleModelList[index].title!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  SizedBox testTagsSingleScreen(TextTheme textTheme) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: singleArticleController.tagsModelList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            var tagId = singleArticleController.tagsModelList[index].id!;
            await Get.find<ListArticleController>()
                .getArticleListwithTagsId(tagId);

            Get.to(ArticleListScreen(
                singleArticleController.tagsModelList[index].title!));
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? 8 : 15, 8),
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: SolidColors.surfaceColor),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                child: Text(
                  singleArticleController.tagsModelList[index].title!,
                  style: textTheme.labelSmall,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
