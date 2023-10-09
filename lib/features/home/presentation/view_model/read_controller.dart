import 'package:firebase/core/models/item_model.dart';
import 'package:firebase/core/services/firebase_services/firestore/firestore_get.dart';
import 'package:get/get.dart';

class ReadController extends GetxController {
  FirestoreGet firestore = FirestoreGet();
  final cars = <ItemModel>[].obs;
  final isLoading = false.obs;
  getCars() {
    isLoading.value = true;
    firestore.getCars().then((value) {
      for (int i = 0; i < value.length; i++) {
        cars.add(value[i]);
      }
    });
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    getCars();
    super.onInit();
  }
}
