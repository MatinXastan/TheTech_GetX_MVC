import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:thetech_getx/components/my_colors.dart';
import 'package:thetech_getx/gen/assets.gen.dart';
import 'package:thetech_getx/views/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainScreen(),
        ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.splash.image(height: 64),
              const SizedBox(
                height: 32,
              ),
              const SpinKitFadingCube(
                color: SolidColors.primaryColor,
                size: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
