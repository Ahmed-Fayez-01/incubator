import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/core/shared_components/custom_button.dart';
import 'package:incubator/core/shared_components/default_text_form_field.dart';
import 'package:incubator/core/text_styles/styles.dart';
import 'package:incubator/core/utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class IncubatorViewBody extends StatefulWidget {
  IncubatorViewBody({super.key});

  @override
  State<IncubatorViewBody> createState() => _IncubatorViewBodyState();
}

class _IncubatorViewBodyState extends State<IncubatorViewBody> {
  TextEditingController name = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController code = TextEditingController();

  TextEditingController day = TextEditingController();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppConstant.height20(context)),
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: AppConstant.width20(context),
              vertical: AppConstant.height30(context),
            ),
            decoration: BoxDecoration(
              color: const Color(0xffFBD79B),
              borderRadius: BorderRadius.circular(
                AppConstant.sp10(context),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Incubator cases",
                        style: Styles.splashTitle(context)
                            .copyWith(fontSize: MediaQuery.of(context).size.height * .02),
                      ),
                      SizedBox(height: AppConstant.height10(context)),
                      Text(
                        "Incubator density Your today",
                        style: Styles.splashTitle(context).copyWith(
                          fontSize: MediaQuery.of(context).size.height * .016,
                          color: const Color(0xff000000).withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: MediaQuery.of(context).size.height * .04,
                  progressColor: CustomColor.primaryColor,
                  lineWidth: 8,
                  percent: 0.8,
                  backgroundColor: Colors.black.withOpacity(0.15),
                  center: Text(
                    "80%",
                    style: Styles.splashTitle(context).copyWith(
                        fontSize: MediaQuery.of(context).size.height * .016, color: const Color(0xff101010)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppConstant.height30(context)),
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: AppConstant.width30(context),
              vertical: AppConstant.height10(context),
            ),
            decoration: BoxDecoration(
              color: CustomColor.primaryColor,
              borderRadius: BorderRadius.circular(
                AppConstant.sp30(context),
              ),
            ),
            child: Text(
              "Add a case",
              style: Styles.homeMainTitle(context).copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: AppConstant.height30(context)*1.5),
      
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppConstant.width20(context)),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  DefaultTextFormField(
                    textInputType: TextInputType.text,
                    controller: name,
                    hintText: "Enter your name",
                    prefixIcon: const Icon(CupertinoIcons.person),
                    validationMsg: "please enter your name",
                    borderRadius: AppConstant.sp30(context),
                  ),
                  SizedBox(height: AppConstant.height20(context)*1.5,),
                  DefaultTextFormField(
                    textInputType: TextInputType.phone,
                    controller: phone,
                    hintText: "Enter your phone number",
                    prefixIcon: const Icon(CupertinoIcons.device_phone_portrait),
                    validationMsg: "please enter your phone number",
                    borderRadius: AppConstant.sp30(context),
                  ),
                  SizedBox(height: AppConstant.height20(context)*1.5,),
                  Row(
                    children: [
                      Flexible(
                        child: DefaultTextFormField(
                          textInputType: TextInputType.text,
                          controller: day,
                          hintText: "Day :",
                          prefixIcon: const Icon(CupertinoIcons.calendar),
                          validationMsg: "please select the day",
                          borderRadius: AppConstant.sp30(context),
                          readOnly: true,
                          onTap: (){
                            showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2080,1,1)).then((value) {
                              day.text=DateFormat.yMd().format(value!);
                            });
                          },
                        ),
                      ),
                      SizedBox(width: AppConstant.width10(context),),
                      Flexible(
                        child: DefaultTextFormField(
                          textInputType: TextInputType.number,
                          controller: age,
                          prefixIcon: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(" Age : ",style: Styles.hintText(context),),
                            ],
                          ),
                          validationMsg: "please enter your age",
                          borderRadius: AppConstant.sp30(context),
                        ),
                      ),
                      SizedBox(width: AppConstant.width10(context),),
                      Flexible(
                        child: DefaultTextFormField(
                          textInputType: TextInputType.number,
                          controller: code,
                          // hintText: "Code :",
                          prefixIcon: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(" Code : ",style: Styles.hintText(context),),
                            ],
                          ),
                          validationMsg: "please enter the code",
                          borderRadius: AppConstant.sp30(context),
                        ),
                      ),
      
                    ],
                  ),
                  SizedBox(height: AppConstant.height20(context)*2,),
                  DefaultButton(onPress: (){
                    if(formKey.currentState!.validate()){
                      
                    }
                  }, text: "Save",borderRadius: AppConstant.sp30(context),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
