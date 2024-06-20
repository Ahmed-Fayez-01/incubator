import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/features/auth/auth_intro_view.dart';
import 'package:incubator/features/auth/verification_view.dart';

import '../../core/assets/assets.dart';
import '../../core/shared_components/custom_button.dart';
import '../../core/shared_components/default_text_form_field.dart';
import '../../core/text_styles/styles.dart';
import '../../core/utils/constants.dart';


class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  var email = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstant.width20(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                "Forgot password?",
                style:TextStyle(
                  fontSize: MediaQuery.of(context).size.height*.026,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xffF59E0B)
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                  "Don’t worry! It happens. Please enter the email associated with your account.",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                      fontSize: MediaQuery.of(context).size.height*.016,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff898A8D)
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Form(
                key: formKey,
                child: DefaultTextFormField(
                  textInputType: TextInputType.emailAddress,
                  controller: email,
                  borderRadius: 30.r,
                  hintText: "Enter your email",
                  validation: (String? value) {
                    if (value!.isEmpty) {
                      return "Required Field";
                    } else if (EmailValidator.validate(value)) {
                      return null;
                    } else {
                      return "Email Syntax Error";
                    }
                  },
                  prefixIcon: SvgPicture.asset(
                    AssetData.email,
                    fit: BoxFit.scaleDown,
                  ),
                  contentPaddingHorizontal: AppConstant.width20(context),
                  contentPaddingVertical: AppConstant.height20(context),
                ),
              ),
              SizedBox(height: AppConstant.height30(context)*2),
              DefaultButton(
                onPress: () {
                  if(formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> VerificationView(email: email.text )));
                  }
                },
                text: "Send Code",
                borderRadius: AppConstant.sp30(context),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember password?",
                    style: Styles.descriptionGrey(context)
                        .copyWith(color: Colors.black, fontSize: MediaQuery.of(context).size.height * .017),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const AuthIntroView()));
                      },
                      child: Text(
                        "Log in",
                        style: Styles.descriptionGrey(context).copyWith(
                            color: CustomColor.primaryColor,
                            fontSize: MediaQuery.of(context).size.height * .017,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
