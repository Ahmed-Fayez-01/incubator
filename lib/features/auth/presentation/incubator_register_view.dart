import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/features/auth/presentation/incubator_login_view.dart';
import 'package:incubator/features/auth/presentation/view_model/register/register_cubit.dart';
import 'package:incubator/features/auth/presentation/view_model/register/register_states.dart';

import '../../../core/assets/assets.dart';
import '../../../core/shared_components/custom_button.dart';
import '../../../core/shared_components/default_text_form_field.dart';
import '../../../core/text_styles/styles.dart';
import '../../../core/utils/constants.dart';
import 'auth_intro_view.dart';

class IncubatorRegisterView extends StatefulWidget {
  const IncubatorRegisterView({super.key});

  @override
  State<IncubatorRegisterView> createState() => _IncubatorRegisterViewState();
}

class _IncubatorRegisterViewState extends State<IncubatorRegisterView> {
  var formKeyLogin = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstant.sp20(context)),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppConstant.height30(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          "Sign Up",
                          style: Styles.splashTitle(context),
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: AppConstant.height10(context),
                // ),

                SizedBox(
                  height: AppConstant.height30(context) * 1.5,
                ),

                Form(
                  key: formKeyLogin,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextFormField(
                        textInputType: TextInputType.text,
                        controller: firstName,
                        maxLines: 1,
                        hintText: "Enter your first name",
                        borderRadius: 30.r,
                        hasBorder: true,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return "ValidationEmptyText".tr();
                          }
                        },
                        prefixIcon: SvgPicture.asset(
                          AssetData.user,
                          color: Colors.grey,
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
                        controller: lastName,
                        maxLines: 1,
                        hintText: "Enter your last name",
                        borderRadius: 30.r,
                        hasBorder: true,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return "ValidationEmptyText".tr();
                          }
                        },
                        prefixIcon: SvgPicture.asset(
                          AssetData.user,
                          color: Colors.grey,
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
                        textInputType: TextInputType.emailAddress,
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
                              style: Styles.descriptionGrey(context).copyWith(
                                  color: Colors.black, fontSize: MediaQuery.of(context).size.height * .017),
                              children: const [
                                TextSpan(
                                    text: ' Terms of Service and Privacy Policy',
                                    style: TextStyle(color: CustomColor.primaryColor)),
                              ],
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      BlocConsumer<RegisterCubit, RegisterStates>(listener: (context, state) {
                        if (state is RegisterSuccessState) {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => IncubatorLoginView(isParent: true)));
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Sign up Successfully"),
                            backgroundColor: Colors.green,
                          ));
                        } else if (state is RegisterErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.error),
                            backgroundColor: Colors.red,
                          ));
                        }
                      }, builder: (context, state) {
                        return state is RegisterLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : DefaultButton(
                                onPress: () {
                                  if (formKeyLogin.currentState!.validate()) {
                                    if (termsAccepted) {
                                      context.read<RegisterCubit>().register(data: {
                                        "firstName": firstName.text,
                                        "lastName": lastName.text,
                                        "email": email.text,
                                        "password": password.text,
                                        "role": "USER"
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text("Please, Accept Terms of Service and Privacy Policy"),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  }
                                },
                                text: 'signup'.tr(),
                                borderRadius: AppConstant.sp30(context),
                              );
                      }),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: Styles.descriptionGrey(context).copyWith(
                                color: Colors.black, fontSize: MediaQuery.of(context).size.height * .017),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const AuthIntroView()),
                                  (route) => false);
                            },
                            child: Text(
                              "Sign In",
                              style: Styles.descriptionGrey(context).copyWith(
                                  color: CustomColor.primaryColor,
                                  fontSize: MediaQuery.of(context).size.height * .017,
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
    );
  }
}
