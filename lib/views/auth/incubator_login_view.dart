import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incubator/core/assets/assets.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/core/utils/constants.dart';

import '../../core/shared_components/custom_button.dart';
import '../../core/shared_components/default_text_form_field.dart';
import '../../core/text_styles/styles.dart';

class IncubatorLoginView extends StatefulWidget {
  IncubatorLoginView({super.key});

  @override
  State<IncubatorLoginView> createState() => _IncubatorLoginViewState();
}

class _IncubatorLoginViewState extends State<IncubatorLoginView> {
  var formKeyLogin = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstant.sp20(context)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      "Login as Incubator",
                      style: Styles.splashTitle(context),
                    ),
                    SizedBox(
                      height: AppConstant.height30(context),
                    ),
                    Form(
                      key: formKeyLogin,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextFormField(
                            textInputType: TextInputType.text,
                            controller: email,
                            maxLines: 1,
                            hintText: "emailHintText".tr(),
                            borderRadius: 30.r,
                            hasBorder: true,
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "ValidationEmptyText".tr();
                              } else if (EmailValidator.validate(value)) {
                                return null;
                              } else {
                                return "emailValidationSyntaxText".tr();
                              }
                            },
                            prefixIcon: SvgPicture.asset(
                              AssetData.email,
                              fit: BoxFit.scaleDown,
                            ),
                            borderSideWidth: 1,
                            contentPaddingHorizontal: 20.w,
                            contentPaddingVertical: 15.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefaultTextFormField(
                            textInputType: TextInputType.text,
                            controller: password,
                            isPassword: true,
                            maxLines: 1,
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "ValidationEmptyText".tr();
                              }
                            },
                            hintText: "passwordHintText".tr(),
                            borderRadius: 30.r,
                            hasBorder: true,
                            prefixIcon: SvgPicture.asset(
                              AssetData.lock,
                              fit: BoxFit.scaleDown,
                            ),
                            borderSideWidth: 1,
                            contentPaddingHorizontal: 20.w,
                            contentPaddingVertical: 15.h,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "forgetPasswordText".tr(),
                                  style:
                                      Styles.onboardingTitleText(context).copyWith(
                                    fontSize: 14.sp,
                                        color: Colors.black
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          DefaultButton(
                            onPress: () {
                              if (formKeyLogin.currentState!.validate()) {}
                            },
                            text: 'login'.tr(),
                            borderRadius: AppConstant.sp30(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
