import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubator/features/upload_file/presentation/view_model/upload_file_cubit/upload_file_states.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  UploadFileCubit() : super(UploadFileInitState());

  static UploadFileCubit get(context) => BlocProvider.of(context);

  File? selectedFile;

  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      selectedFile = File(result.files.single.path!);
    }
    emit(SelectFileSuccessState());
  }
}
