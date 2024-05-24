import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/core/utils/constants.dart';
import 'package:incubator/features/onboarding/widgets/progress_dots.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/services/local/cache_helper/cache_helper.dart';
import '../../../../../core/text_styles/styles.dart';
import '../../auth/auth_intro_view.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {Key? key,
      required this.image,
      required this.description,
      required this.noOfScreen,
      required this.onNextPressed,
      required this.currentScreenNo})
      : super(key: key);

  final Image image;

  final String description;

  final int noOfScreen;

  final Function(int) onNextPressed;

  final int currentScreenNo;

  @override
  Widget build(BuildContext context) {
    bool isLastScreen = currentScreenNo >= noOfScreen - 1;
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstant.width20(context)),
                    child: GestureDetector(onTap: (){
                      CacheHelper.saveData(key: "onBoarding", value: true);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AuthIntroView()),
                              (route) => false);
                    },child: const Text("Skip")),
                  ),
                ],
              ),
              SizedBox(
                height: AppConstant.height30(context),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    image,
                  ],
                ),
              ),
              SizedBox(
                height: AppConstant.height20(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .12,
                    vertical: MediaQuery.of(context).size.width * .05),
                child: Text(
                  description,
                  style: Styles.onBoardingDescriptionText(context),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: AppConstant.height20(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int index = 0; index < noOfScreen; index++)
                    ProgressDots(
                      isActiveScreen: (index == currentScreenNo) ? true : false,
                    )
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
              child: Visibility(
                  visible: currentScreenNo != 0,
                  replacement: const SizedBox(),
                  child: GestureDetector(
                    onTap: () {
                      onNextPressed(currentScreenNo - 1);
                    },
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * .07,
                      backgroundColor: const Color(0xffDCDCDC),
                      child: SvgPicture.asset(
                        AssetData.arrowLeft,
                        width: MediaQuery.of(context).size.width * .06,
                      ),
                    ),
                  )),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
              child: GestureDetector(
                onTap: () {
                  if (isLastScreen) {
                    CacheHelper.saveData(key: "onBoarding", value: true);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthIntroView()),
                        (route) => false);
                  } else {
                    onNextPressed(currentScreenNo + 1);
                  }
                },
                child: CircularPercentIndicator(
                  radius: MediaQuery.of(context).size.width * .08,
                  lineWidth: 2.0,
                  percent: (currentScreenNo + 1) * .33,
                  center: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * .065,
                    backgroundColor: CustomColor.primaryColor,
                    child: SvgPicture.asset(
                      AssetData.arrowRight,
                      width: MediaQuery.of(context).size.width * .06,
                    ),
                  ),
                  progressColor: CustomColor.primaryColor,
                  backgroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
