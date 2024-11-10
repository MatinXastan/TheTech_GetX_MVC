import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thetech_getx/route_manager/binding.dart';
import 'package:thetech_getx/constant/my_colors.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/constant/my_string.dart';
import 'package:thetech_getx/controller/home_screen_controller.dart';
import 'package:thetech_getx/controller/article/list_article_controller.dart';
import 'package:thetech_getx/controller/article/single_article_controller.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/main.dart';
import 'package:thetech_getx/models/fake_data.dart';
import 'package:thetech_getx/route_manager/names.dart';
import 'package:thetech_getx/views/articles_screens/article_list_screen.dart';
import 'package:thetech_getx/views/articles_screens/single_screen.dart';
import 'package:thetech_getx/views/podcast/single_podcast.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  ListArticleController listArticleController =
      Get.put(ListArticleController());

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 60),
          // ignore: unrelated_type_equality_checks
          child: homeScreenController.loading == false
              ? Column(
                  children: [
                    poster(),
                    const SizedBox(
                      height: 16,
                    ),
                    tags(),
                    const SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(ArticleListScreen('داغ ترین نوشته ها'));
                        },
                        child: SeeMoreBlog(
                          bodyMargin: bodyMargin,
                          textTheme: textTheme,
                          title: MyStrings.viewHotestBlog,
                        )),
                    topVisited(),
                    SeeMorePodcast(
                        bodyMargin: bodyMargin, textTheme: textTheme),
                    topPodcast(),
                  ],
                )
              : const Center(child: Loading()),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: Get.height / 3.5,
      child: ListView.builder(
        itemCount: homeScreenController.topVisitedList.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await singleArticleController.getArticleInfo(
                  homeScreenController.topVisitedList[index].id);

              Get.to(SingleScreen(), binding: ArticleBinding());
            },
            child: Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
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
                            imageUrl: homeScreenController
                                .topVisitedList[index].image!,
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
                                homeScreenController
                                    .topVisitedList[index].author!,
                                style: textTheme.titleLarge,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homeScreenController
                                        .topVisitedList[index].view!,
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
                      homeScreenController.topVisitedList[index].title!,
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
            ),
          );
        },
      ),
    );
  }

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcasts.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  NameRoute.routeSinglePodcast,
                  arguments: homeScreenController.topPodcasts[index],
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: size.height / 5.3,
                        width: size.width / 2.4,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topPodcasts[index].poster!,
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
                    ),
                    SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        homeScreenController.topPodcasts[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                colors: GradientColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap['writer'] +
                        ' - ' +
                        homePagePosterMap['date'],
                    style: textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap['view'],
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
              Text(
                homeScreenController.poster.value.title!,
                style: textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              listArticleController.getArticleListwithTagsId(
                  homeScreenController.tagList[index].id!);
              Get.to(ArticleListScreen('test'));
            },
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(
                textTheme: textTheme,
                index: index,
                /* hashTagList: tagList,
                whichOneIsTag: whichTags.isHashtagMain, */
                /* onTap: (String) {}, */
              ),
            ),
          );
        },
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.bluePen.path),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
