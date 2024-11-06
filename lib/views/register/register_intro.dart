import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thetech_getx/constant/my_string.dart';
import 'package:thetech_getx/controller/register_controller.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/views/my_cats.dart';

// ignore: must_be_immutable
class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});
  // RegisterController registerController = Get.put(RegisterController());
  var registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.tcbot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                //TODO rechText
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: MyStrings.welcom, style: textTheme.displayLarge)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                    onPressed: () {
                      _showEmailBottomSheet(context, size, textTheme);
                    },
                    child: const Text(
                      'بزن بریم',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: Get.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.displayLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      controller: registerController.emailTextEditingController,
                      style: textTheme.labelSmall,
                      textAlign: TextAlign.center,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          hintText: 'techblog@gmail.com',
                          hintStyle: textTheme.displayLarge),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        registerController.register();
                        Navigator.pop(context);
                        _activerCodeBottomSheet(context, size, textTheme);
                      },
                      child: const Text(
                        'ادامه',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //TODO بالا آوردن یک باتم شیت
  Future<dynamic> _activerCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: textTheme.displayLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      controller:
                          registerController.activeCodeTextEditingController,
                      style: textTheme.labelSmall,
                      textAlign: TextAlign.center,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          hintText: '******', hintStyle: textTheme.labelSmall),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        registerController.verify();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MyCats(),
                        ));
                      },
                      child: const Text('ادامه',
                          style: TextStyle(color: Colors.white)))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
