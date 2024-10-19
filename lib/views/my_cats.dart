import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thetech_getx/components/my_colors.dart';
import 'package:thetech_getx/components/my_components.dart';
import 'package:thetech_getx/components/my_string.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/models/fake_data.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  Assets.images.tcbot.path,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  MyStrings.successfulRegistration,
                  style: textTheme.labelSmall,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'نام و نام خانوادگی',
                    hintStyle: textTheme.displayLarge,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  MyStrings.chooseCats,
                  style: textTheme.labelSmall,
                ),
                //taglist
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    height: 85,
                    width: double.infinity,
                    child: GridView.builder(
                      itemCount: tagList.length,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              childAspectRatio: 0.3),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags.contains(tagList[index])) {
                                selectedTags.add(tagList[index]);
                              } else {
                                print('the value has alreay exist');
                              }
                            });
                          },
                          child: RegesterMainTags(
                            textTheme: textTheme,
                            index: index,
                            /* onTap: (p0) {}, */
                          ),
                        );

                        /* MainTags(
                            textTheme: textTheme,
                            index: index,
                            hashTagList: tagList,
                            whichOneIsTag: whichTags.isHashtagMain,
                            onTap: (value) {
                              bool isrepeat = false;
                              for (var i = 0; i < myCats.length; i++) {
                                if (myCats[i].title == value) {
                                  print('already exist');
                                  isrepeat = true;
                                }
                              }
                              if (isrepeat == false) {
                                setState(() {
                                  myCats.add(HashTagModel(title: value));
                                });
                              }
                            }); */
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  Assets.icons.downCatArrow.path,
                  scale: 3,
                ),
                //selected tags
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    height: 85,
                    width: double.infinity,
                    //TODO کار کردن با گریدویو
                    child: GridView.builder(
                      itemCount: selectedTags.length,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              childAspectRatio: 0.2),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: SolidColors.surfaceColor),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  selectedTags[index].title,
                                  style: textTheme.labelSmall,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                        /* MainTags(
                          textTheme: textTheme,
                          index: index,
                          hashTagList: myCats,
                          whichOneIsTag: whichTags.isHashtagMain,
                          onTap: (String) {},
                        ); */
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
