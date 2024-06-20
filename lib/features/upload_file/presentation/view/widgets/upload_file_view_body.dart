import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/core/shared_components/custom_button.dart';
import 'package:incubator/core/shared_components/default_text_form_field.dart';
import 'package:incubator/core/text_styles/styles.dart';
import 'package:incubator/core/utils/constants.dart';
import 'package:incubator/features/upload_file/presentation/view_model/upload_file_cubit/upload_file_cubit.dart';
import 'package:incubator/features/upload_file/presentation/view_model/upload_file_cubit/upload_file_states.dart';

class UploadFileViewBody extends StatefulWidget {
  const UploadFileViewBody({super.key});

  @override
  State<UploadFileViewBody> createState() => _UploadFileViewBodyState();
}

class _UploadFileViewBodyState extends State<UploadFileViewBody> {
  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

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
                height: AppConstant.height20(context) * 3,
              ),
              BlocBuilder<UploadFileCubit, UploadFileState>(builder: (context, state) {
                return UploadFileCubit.get(context).selectedFile == null
                    ? Icon(
                        Icons.upload_file,
                        size: MediaQuery.of(context).size.width * 0.3,
                        color: CustomColor.primaryColor,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Icon(
                            Icons.upload_file,
                            size: MediaQuery.of(context).size.width * 0.2,
                            color: CustomColor.primaryColor,
                          ),
                          Text(
                            UploadFileCubit.get(context).selectedFile!.path.split("/").last,
                            style: Styles.hintText(context),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
              }),
              SizedBox(
                height: AppConstant.height20(context) * 3,
              ),
              BlocBuilder<UploadFileCubit, UploadFileState>(builder: (context, state) {
                return DefaultButton(
                  onPress: () {
                    UploadFileCubit.get(context).selectFile();
                  },
                  text: UploadFileCubit.get(context).selectedFile == null ? "Select File" : "Upload File",
                  borderRadius: AppConstant.sp30(context),
                );
              }),
              SizedBox(
                height: AppConstant.height20(context),
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
