import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/core/helper/overlay_helper.dart';
import 'package:firebase/core/models/item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirestoreGet {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<ItemModel>> getCars() async {
    try {
      QuerySnapshot<Map<String, dynamic>> cars = await firestore
          .collection('cars')
          .doc(auth.currentUser!.uid)
          .collection('listOfCars')
          .get();
      return cars.docs.map((e) => ItemModel.fromJson(e.data())).toList();
    } catch (e) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        e.toString(),
      );
    }
    return [];
  }
}
