import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/features/auth/auth_intro_view.dart';

import '../../core/assets/assets.dart';
import '../../core/shared_components/custom_button.dart';
import '../../core/text_styles/styles.dart';
import '../../core/utils/constants.dart';


class PasswordChangedView extends StatelessWidget {
  const PasswordChangedView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            // here the desired height
            child: AppBar(
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.white,
                statusBarBrightness: Brightness.dark,
              ),
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstant.width20(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppConstant.height20(context)),
                  SvgPicture.asset(AssetData.congratulation, width: MediaQuery
                      .of(context)
                      .size
                      .width * .8,),
                  SizedBox(height: AppConstant.height20(context)),
                  Text(
                    "Password changed",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*.032,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xffF59E0B)
                    )
                  ),
                  SizedBox(height: AppConstant.height10(context)),
                  Text(
                      "Your password has been changed succesfully",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*.02,
                          fontWeight: FontWeight.w400,
                          color: const Color(0x80000000)
                      )
                  ),
                ],
              ),
              SizedBox(height: AppConstant.height30(context)*2),
              DefaultButton(onPress: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const AuthIntroView()));
              }, text: "Back to Login", borderRadius: AppConstant.sp10(context),),
              SizedBox(height: AppConstant.height20(context),),
            ],
          ),
        ),
      ),
    );
  }
}
