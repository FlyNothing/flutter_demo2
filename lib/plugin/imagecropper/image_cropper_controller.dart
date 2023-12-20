import 'dart:io';

import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCropperController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  final ImageCropper _imageCropper = ImageCropper();
  CroppedFile? croppedFile;

  Future<void> pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      cropImage(File(imageFile.path));
    }
  }

  Future<void> cropImage(File image) async {
    CroppedFile? cfile = await _imageCropper.cropImage(
      sourcePath: image.path,
      // 当设置aspectRatio后将锁定裁剪器，用户无法调整。
      // 可以通过AndroidUiSettings.lockAspectRatio取消锁定。
      // aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 2),

      // 控制裁剪菜单视图的纵横比列表
      // 如设置aspectRatio则纵横比被锁定，无法选择
      // 可以被AndroidUiSettings.initAspectRatio覆盖后，无法选择
      aspectRatioPresets: [CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.original, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio16x9],
      // 设置裁剪器形状：圆形和矩形
      // cropStyle: CropStyle.circle,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: gColorLightPrimary,
          toolbarWidgetColor: gColorWhite,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: Get.context!,
        ),
      ],
    );
    croppedFile = cfile;
    update();
  }
}
