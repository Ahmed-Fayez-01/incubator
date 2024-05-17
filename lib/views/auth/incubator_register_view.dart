import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/views/auth/auth_intro_view.dart';

import '../../core/assets/assets.dart';
import '../../core/shared_components/custom_button.dart';
import '../../core/shared_components/default_text_form_field.dart';
import '../../core/text_styles/styles.dart';
import '../../core/utils/constants.dart';

class IncubatorRegisterView extends StatefulWidget {
  const IncubatorRegisterView({super.key});

  @override
  State<IncubatorRegisterView> createState() => _IncubatorRegisterViewState();
}

class _IncubatorRegisterViewState extends State<IncubatorRegisterView> {
  var formKeyLogin = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool termsAccepted = false;

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
                      "Sign Up",
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
                            hintText: "userHintText".tr(),
                            borderRadius: 30.r,
                            hasBorder: true,
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "ValidationEmptyText".tr();
                              }
                            },
                            prefixIcon: SvgPicture.asset(
                              AssetData.user,
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
                            children: [
                              Checkbox(
                                value: termsAccepted,
                                checkColor: Colors.white,
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                activeColor: CustomColor.primaryColor,
                                onChanged: (bool? value) {
                                  setState(() {
                                    termsAccepted = value!;
                                  });
                                },
                              ),
                              Expanded(
                                  child: RichText(
                                text: TextSpan(
                                  text: "I agree to the healthcare",
                                  style: Styles.descriptionGrey(context)
                                      .copyWith(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .017),
                                  children: const [
                                    TextSpan(
                                        text:
                                            ' Terms of Service and Privacy Policy',
                                        style: TextStyle(
                                            color: CustomColor.primaryColor)),
                                  ],
                                ),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          DefaultButton(
                            onPress: () {
                              if (formKeyLogin.currentState!.validate()) {}
                            },
                            text: 'signup'.tr(),
                            borderRadius: AppConstant.sp30(context),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account? ",
                                style: Styles.descriptionGrey(context).copyWith(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .017),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AuthIntroView()),
                                      (route) => false);
                                },
                                child: Text(
                                  "Sign In",
                                  style: Styles.descriptionGrey(context)
                                      .copyWith(
                                          color: CustomColor.primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .017,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
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
