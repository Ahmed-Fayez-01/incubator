import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:incubator/core/shared_components/custom_button.dart';
import 'package:incubator/core/shared_components/default_text_form_field.dart';
import 'package:incubator/core/text_styles/styles.dart';
import 'package:incubator/core/utils/constants.dart';

class VisitingViewBody extends StatefulWidget {
  const VisitingViewBody({super.key});

  @override
  State<VisitingViewBody> createState() => _VisitingViewBodyState();
}

class _VisitingViewBodyState extends State<VisitingViewBody> {
  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController code = TextEditingController();

  TextEditingController time = TextEditingController();
  TextEditingController comment = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstant.width20(context)),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppConstant.height20(context)),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                controller: name,
                hintText: "Enter your name",
                prefixIcon: const Icon(CupertinoIcons.person),
                validationMsg: "please enter your name",
                borderRadius: AppConstant.sp30(context),
              ),
              SizedBox(
                height: AppConstant.height20(context) * 1.5,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.emailAddress,
                controller: email,
                hintText: "Enter your email",
                prefixIcon: const Icon(CupertinoIcons.mail),
                validationMsg: "please enter your email",
                borderRadius: AppConstant.sp30(context),
              ),
              SizedBox(
                height: AppConstant.height20(context) * 1.5,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.phone,
                controller: phone,
                hintText: "Enter your phone number",
                prefixIcon: const Icon(CupertinoIcons.device_phone_portrait),
                validationMsg: "please enter your phone number",
                borderRadius: AppConstant.sp30(context),
              ),
              SizedBox(
                height: AppConstant.height20(context) * 1.5,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.number,
                controller: code,
                // hintText: "Code :",
                prefixIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Code : ",
                      style: Styles.hintText(context),
                    ),
                  ],
                ),
                validationMsg: "please enter the code",
                borderRadius: AppConstant.sp30(context),
              ),
              SizedBox(
                height: AppConstant.height20(context) * 1.5,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                controller: time,
                hintText: "Time :",
                prefixIcon: const Icon(CupertinoIcons.time),
                validationMsg: "please select the time",
                borderRadius: AppConstant.sp30(context),
                readOnly: true,
                onTap: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                    time.text = value!.format(context);
                  });
                },
              ),
              SizedBox(
                height: AppConstant.height20(context) * 1.5,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                controller: comment,
                hintText: "Comments :",
                validationMsg: "please enter your comment",
                borderRadius: AppConstant.sp30(context),
                maxLines: 5,
              ),
              SizedBox(
                height: AppConstant.height20(context) * 2,
              ),
              DefaultButton(
                onPress: () {
                  if (formKey.currentState!.validate()) {}
                },
                text: "Send",
                borderRadius: AppConstant.sp30(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
