import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incubator/core/assets/assets.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/core/shared_components/custom_button.dart';
import 'package:incubator/core/shared_components/default_text_form_field.dart';
import 'package:incubator/core/text_styles/styles.dart';
import 'package:incubator/core/utils/constants.dart';
import 'package:incubator/features/incubator/presentation/view_models/add_case/add_case_cubit.dart';
import 'package:incubator/features/incubator/presentation/view_models/add_case/add_case_states.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../main_layout/presentation/views/main_layout_view.dart';

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
                    hintText: "Enter Case Name",
                    prefixIcon: SvgPicture.asset(AssetData.user,fit: BoxFit.scaleDown,),
                    validationMsg: "please enter your name",
                    borderRadius: AppConstant.sp30(context),
                  ),
                  SizedBox(height: AppConstant.height20(context)*1.5,),
                  DefaultTextFormField(
                    textInputType: TextInputType.text,
                    controller: phone,
                    prefixIcon: SvgPicture.asset(AssetData.disease,fit: BoxFit.scaleDown,color: const Color(0x80000000),),
                    hintText: "Enter Case Disease",
                    validationMsg: "please enter case disease",
                    borderRadius: AppConstant.sp30(context),
                  ),
                  SizedBox(height: AppConstant.height20(context)*1.5,),
                  Row(
                    children: [
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
                  BlocConsumer<AddCaseCubit, AddCaseStates>(
                    listener: (context, state) {
                      if (state is AddCaseSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("AddCase Successfully"),
                          backgroundColor: Colors.green,
                        ));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const MainLayoutView()),
                                (route) => false);
                      } else if (state is AddCaseErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    builder: (context, state) {
                      return state is AddCaseLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : DefaultButton(
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AddCaseCubit>().addCase(data: {
                              "fullName" : name.text,
                              "code" : code.text,
                              "disease" : phone.text,
                              "age" : age.text
                            });
                          }
                        },
                        text: 'Save'.tr(),
                        borderRadius: AppConstant.sp30(context),
                      );
                    },
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
