import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aspinwal/app/modules/splash_screen_module/splash_screen_controller.dart';


class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context)=>GetBuilder<SplashScreenController>(builder: (builder) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              color: Colors.white,

            ),
            Container(
              alignment: Alignment.center,
              height: height/3.8,
              width: width/1.7,
              margin: EdgeInsets.only(top: height/3.9,left: width/4.5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width/2)

              ),

              //child: Image.asset('assets/logo.jfif'),
              child: Image.asset('assets/wellcomelogo.png'),
            ),
            Container(
              alignment: Alignment.center,
              height: height/3.8,
              width: width/1.7,
              margin: EdgeInsets.only(top: height/1.9,left: width/4.5),
              child: Image.asset('assets/spLoding.gif'),
            ),
          ],

        ),

      ),
    );
  });
}
