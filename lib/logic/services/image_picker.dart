import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

///[getImage] implementation of our image picker
/// It returns a value of our image picker
Future getImage(ImgSource source, BuildContext context) async {
  var image = await ImagePickerGC.pickImage(
      enableCloseButton: true,
      closeIcon: const Icon(
        EvaIcons.close,
        color: Colors.red,
        size: 12,
      ),
      context: context,
      source: source,
      barrierDismissible: true,
      cameraIcon: const Icon(
        EvaIcons.camera,
        color: Colors.red,
      ),
      cameraText: const Text(
        'From Camera',
        style: TextStyle(color: Colors.red),
      ),
      galleryText: const Text(
        'From Gallery',
        style: TextStyle(color: Colors.blue),
      ));
  return image;
}
