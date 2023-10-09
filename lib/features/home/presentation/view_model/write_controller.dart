import 'package:firebase/core/helper/overlay_helper.dart';
import 'package:firebase/core/models/item_model.dart';
import 'package:firebase/core/services/firebase_services/firestore/firestore_add.dart';
import 'package:firebase/core/services/firebase_services/storage/storage_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WriteController extends GetxController {
  ImagePicker imagePiker = ImagePicker();
  FirestoreAdd firstore = FirestoreAdd();
  Storage storage = Storage();
  String name = '';
  String model = '';
  String color = '';
  final image = ''.obs;
  changeName(value) => name = value;
  changeModel(value) => model = value;
  changeColor(value) => color = value;
  selectedImageFromGallary() async {
    try {
      XFile? result = await imagePiker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
      );
      if (result != null) {
        image.value = result.path;
      }
    } catch (e) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        e.toString(),
      );
    }
  }

  Future<String> addImageToStorage({required String pathImage}) {
    return storage.addImage(pathImage: pathImage);
  }

  submit() async {
    try {
      firstore.addCar(
        model: ItemModel(
          color: color,
          imageUrl: await addImageToStorage(pathImage: image.value),
          name: name,
          model: model,
        ),
        time: DateTime.now().toString(),
      );
      OverlayHelper.showSuccessToast(
        Get.overlayContext!,
        "submitted",
      );
      Get.back();
    } catch (e) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        e.toString(),
      );
    }
  }
}
