import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/core/colors/app_colors.dart';
import 'package:incubator/core/shared_components/custom_button.dart';
import 'package:incubator/core/text_styles/styles.dart';
import 'package:incubator/core/utils/constants.dart';
import 'package:incubator/features/upload_file/presentation/view_model/upload_file_cubit/upload_file_cubit.dart';
import 'package:incubator/features/upload_file/presentation/view_model/upload_file_cubit/upload_file_states.dart';

import '../../../../cases/presentation/view_models/send_file/send_file_cubit.dart';
import '../../../../cases/presentation/view_models/send_file/send_file_states.dart';

class UploadFileViewBody extends StatefulWidget {
  const UploadFileViewBody({super.key, required this.caseId});
  final String caseId;
  @override
  State<UploadFileViewBody> createState() => _UploadFileViewBodyState();
}

class _UploadFileViewBodyState extends State<UploadFileViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstant.width20(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: AppConstant.height20(context)),
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

          BlocConsumer<SendFileCubit, SendFileStates>(
            listener: (context, state) {
              if (state is SendFileSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("SendFile Successfully"),
                  backgroundColor: Colors.green,
                ));
                Navigator.pop(context);
              } else if (state is SendFileErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              return state is SendFileLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : DefaultButton(
                onPress: () {
                  if (UploadFileCubit.get(context).selectedFile!=null) {
                    context.read<SendFileCubit>().sendFile(
                      file : UploadFileCubit.get(context).selectedFile!,
                      caseId : widget.caseId,
                    );
                  }
                },
                text: 'Send',
                borderRadius: AppConstant.sp30(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
