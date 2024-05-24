import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incubator/core/shared_components/custom_button.dart';

import '../../core/assets/assets.dart';
import '../../core/colors/app_colors.dart';
import 'widgets/custom_auth_dialog.dart';
import '../../core/text_styles/styles.dart';
import '../../core/utils/constants.dart';

class AuthIntroView extends StatelessWidget {
  const AuthIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark,
              //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor: Colors.white,
              statusBarBrightness:
                  Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          )),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AssetData.homeDecoration,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * .5,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppConstant.sp20(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetData.logo,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * .4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppConstant.height10(context),
                  ),
                  Text(
                    "My Incubator",
                    style: Styles.splashTitle(context),
                  ),
                  SizedBox(
                    height: AppConstant.height10(context),
                  ),
                  Text(
                    "Let’s get started!",
                    style: Styles.splashTitle(context),
                  ),
                  SizedBox(
                    height: AppConstant.height30(context),
                  ),
                  DefaultButton(
                    onPress: () {
                      customAuthPopUpDialog(context: context);
                    },
                    text: "login as Incubator",
                    borderRadius: AppConstant.sp30(context),
                  ),
                  SizedBox(
                    height: AppConstant.height15(context),
                  ),
                  DefaultButton(
                    onPress: () {},
                    text: "login as parents",
                    borderRadius: AppConstant.sp30(context),
                  ),
                  SizedBox(
                    height: AppConstant.height15(context),
                  ),
                  DefaultButton(
                    onPress: () {},
                    text: "Nearest Incubator",
                    borderRadius: AppConstant.sp30(context),
                    backgroundColor: CustomColor.greyColor,
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
