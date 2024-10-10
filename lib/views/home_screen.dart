import 'package:flutter/material.dart';
import 'package:thetech_getx/components/my_colors.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/components/my_string.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 60),
        child: Column(
          children: [
            HomePagePoster(size: size, textTheme: textTheme),
            const SizedBox(
              height: 16,
            ),
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
            HomePageBlogList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
            HomePagePadcastList(size: size, bodyMargin: bodyMargin),
          ],
        ),
      ),
    );
  }
}

class HomePagePadcastList extends StatelessWidget {
  const HomePagePadcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.2,
      width: size.width,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            child: Column(
              children: [
                Container(
                  height: size.height / 4.5,
                  width: size.width / 2.4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(blogList[index].imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Center(
                    child: Text(
                      'test $index',
                      style: const TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
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

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              image: NetworkImage(blogList[index].imageUrl),
                              fit: BoxFit.cover),
                        ),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: GradientColors.blogPost)),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textTheme.titleLarge,
                            ),
                            Row(
                              children: [
                                Text(
                                  blogList[index].views,
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
                    blogList[index].title,
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
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
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
            MyStrings.viewHotestBlog,
            style: textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: MainTags(
              textTheme: textTheme,
              index: index,
              /* hashTagList: tagList,
              whichOneIsTag: whichTags.isHashtagMain, */
              /* onTap: (String) {}, */
            ),
          );
        },
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: (Image.asset(homePagePosterMap['imageAssets'])).image,
                  fit: BoxFit.cover)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                colors: GradientColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
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
                'دوارده قدم برنامه نویسی یک دوره ی... س',
                style: textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
