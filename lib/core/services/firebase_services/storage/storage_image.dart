import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  FirebaseStorage storage = FirebaseStorage.instance;
  Future<String> addImage({required String pathImage}) async {
    Reference ref = storage.ref().child('car_images/$pathImage');
    TaskSnapshot uploadedImage = await ref.putFile(File(pathImage));
    String imageLink = await uploadedImage.ref.getDownloadURL();
    return imageLink;
  }
}
