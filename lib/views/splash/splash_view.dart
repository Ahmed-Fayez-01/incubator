import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/core/enums/data_type.dart';
import 'package:incubator/core/text_styles/styles.dart';
import 'package:incubator/core/utils/constants.dart';
import 'package:incubator/views/auth/auth_intro_view.dart';
import '../../core/assets/assets.dart';
import '../../core/services/local/cache_helper/cache_helper.dart';
import '../onboarding/onboarding_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if(CacheHelper.getData(key: "onBoarding", dataType: DataType.bool)==true)
        {
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => const AuthIntroView()), (
              route) => false);
        }else
          {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => const OnBoardingView()), (
                route) => false);
          }

    });
  }
  @override
  Widget build(BuildContext context) {
//fayez
    return  Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:  const SystemUiOverlayStyle(
              statusBarColor: CustomColor.primaryColor, // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor: CustomColor.primaryColor,
              statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          )
      ),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AssetData.splashDecoration,
                fit: BoxFit.cover,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .4,
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetData.logo,
                      fit: BoxFit.cover,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .4,
                    ),
                  ],
                ),
                SizedBox(height: AppConstant.height10(context),),
                Text("My Incubator",style: Styles.splashTitle(context),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
