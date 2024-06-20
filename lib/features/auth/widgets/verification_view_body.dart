
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/features/auth/auth_intro_view.dart';
import 'package:incubator/features/auth/reset_password_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../core/assets/assets.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/shared_components/custom_button.dart';
import '../../../core/utils/constants.dart';

class VerificationViewBody extends StatefulWidget {
  const VerificationViewBody({super.key, required this.email});

  final String email;

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  TextEditingController otpCode = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool finished = false;

  @override
  initState() {
    super.initState();
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConstant.height30(context),
                ),
                Text(
                  "Please check your email",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .026, fontWeight: FontWeight.w800,color: Color(0xffF59E0B)),
                ),
                SizedBox(
                  height: AppConstant.height20(context)*2,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: 'Please enter the 6-digit code sent to your email ',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .02, fontWeight: FontWeight.w400,color: const Color(0x80000000)),
                      ),
                      TextSpan(
                        text: '${widget.email} ',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .02, fontWeight: FontWeight.w400,color: const Color(0xffF59E0B)),
                      ),
                      TextSpan(
                        text: 'for verification.',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .02, fontWeight: FontWeight.w400,color: const Color(0x80000000)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppConstant.height30(context)*2,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppConstant.width5(context)),
                    child: PinCodeTextField(
                      length: 6,
                      appContext: context,
                      obscureText: false,
                      cursorColor: CustomColor.primaryColor,
                      cursorWidth: MediaQuery.of(context).size.width * .04,
                      cursorHeight: MediaQuery.of(context).size.height * .003,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * .02),
                          borderWidth: 1,
                          fieldHeight: MediaQuery.of(context).size.height * .08,
                          fieldWidth: MediaQuery.of(context).size.height * .05,
                          activeFillColor: Colors.white,
                          inactiveColor: const Color(0x6B878484),
                          inactiveFillColor: Colors.white,
                          activeColor: CustomColor.primaryColor,
                          selectedFillColor: Colors.white,
                          selectedColor: CustomColor.primaryColor),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "emptyOTP";
                        } else if (value.length < 6) {
                          return "numberOfDigitOTP";
                        }
                        return null;
                      },
                      controller: otpCode,
                      onCompleted: (v) {},
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstant.height30(context)*2,
                ),
                DefaultButton(
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPasswordView(email: "email", code: "code")));
                      }
                    },
                    text: 'Verify',
                    borderRadius: AppConstant.sp30(context)),
                SizedBox(
                  height: AppConstant.height10(context),
                ),
                finished
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          finished=!finished;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            "Didn’t receive any code?",
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * .015,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff101010)),
                          ),
                          SizedBox(width: AppConstant.width5(context),),
                          Text(
                            "Resend Again",
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * .015,
                                fontWeight: FontWeight.w500,
                                color: CustomColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Request new code in ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height * .015),
                          ),
                          Countdown(
                            seconds: 120,
                            build: (BuildContext context, double time) => Text(
                              "${(time~/60).toString()}:${(time.toInt()%60).toInt()}",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * .015,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColor.primaryColor),
                            ),
                            interval: const Duration(seconds: 1),
                            onFinished: () {
                              setState(() {
                                finished = true;
                              });
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
