import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());
  void uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final path = image.path;
      final bytes = await File(path).readAsBytes();
      String imageBase64 = base64Encode(bytes);

      emit(UploadImgState(image: imageBase64));
    }
  }
}
