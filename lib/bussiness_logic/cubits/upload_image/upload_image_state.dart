part of 'upload_image_cubit.dart';

@immutable
abstract class UploadImageState {}

class UploadImageInitial extends UploadImageState {}

class UploadImgState extends UploadImageState {
  final String? image;
  UploadImgState({this.image});
}
