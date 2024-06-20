import 'package:flutter/material.dart';
import 'package:incubator/features/upload_file/presentation/view/widgets/upload_file_view_body.dart';


class UploadFileView extends StatelessWidget {
  const UploadFileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        centerTitle: true,
        title:  const Text("Upload File",style: TextStyle(
          color: Colors.black
        ),),
        shadowColor: Colors.transparent,
      ),
      body: const UploadFileViewBody(),

    );
  }
}
