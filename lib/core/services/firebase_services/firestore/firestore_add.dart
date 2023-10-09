import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/core/helper/overlay_helper.dart';
import 'package:firebase/core/models/item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirestoreAdd {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  addCar({required ItemModel model, required String time}) {
    try {
      firestore
          .collection('cars')
          .doc(auth.currentUser!.uid)
          .collection('listOfCars')
          .doc(time)
          .set(model.toJson());
    } catch (e) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        e.toString(),
      );
    }
  }
}
