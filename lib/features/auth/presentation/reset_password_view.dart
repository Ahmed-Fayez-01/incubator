import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/core/shared_components/custom_button.dart';
import 'package:incubator/core/shared_components/default_text_form_field.dart';
import 'package:incubator/core/utils/constants.dart';
import 'package:incubator/features/auth/presentation/password_changed_view.dart';

import '../../../core/assets/assets.dart';


class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.email, required this.code});

  final String email;
  final String code;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {

  final TextEditingController confirmPassword = TextEditingController();

  final formKey=GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _isStrong = false;
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstant.width20(context)),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppConstant.height30(context),
              ),
              Text(
                "Reset password",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .026, fontWeight: FontWeight.w800,color: CustomColor.primaryColor),
              ),
              SizedBox(
                height: AppConstant.height10(context),
              ),
              Text(
                "Please type something you’ll remember",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .018, fontWeight: FontWeight.w400,color: const Color(0xffA5A5A5)),
              ),
              SizedBox(height: AppConstant.height30(context)),
              DefaultTextFormField(
                textInputType: TextInputType.visiblePassword,
                borderRadius: 30.r,
                controller: _passwordController,
                maxLines: 1,
                onChange: (v){
                  setState(() {

                  });
                },
                validation: (String? value) {
                  if (value!.isEmpty) {
                    return "Required Field";
                  }
                },
                hintText: "New Password",
                hasBorder: true,
                isPassword: true,
                prefixIcon: SvgPicture.asset(
                  AssetData.lock,
                  fit: BoxFit.scaleDown,
                ),
                borderSideWidth: 1,
                contentPaddingHorizontal: AppConstant.width20(context),
                contentPaddingVertical: AppConstant.height20(context),
              ),
              SizedBox(
                height: AppConstant.height10(context),
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                borderRadius: 30.r,
                controller: confirmPassword,
                isPassword: true,
                maxLines: 1,
                validation: (String? value) {
                  if (value!.isEmpty) {
                    return "Required Field";
                  } else if (value != _passwordController.text) {
                    return "Tow Password are Different";
                  }
                },
                hintText: "Confirm Password",
                hasBorder: true,
                prefixIcon: SvgPicture.asset(
                  AssetData.lock,
                  fit: BoxFit.scaleDown,
                ),
                borderSideWidth: 1,
                contentPaddingHorizontal: AppConstant.width20(context),
                contentPaddingVertical: AppConstant.height20(context),
              ),
              SizedBox(height: AppConstant.height30(context)*2),
              DefaultButton(
                onPress: () {
                  if(formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const PasswordChangedView()));
                  }
                },
                text: "Reset Password".toUpperCase(),
                borderRadius: AppConstant.sp30(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
