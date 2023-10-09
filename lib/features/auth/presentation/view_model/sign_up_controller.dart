// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase/core/consts/route.dart';
import 'package:firebase/core/helper/overlay_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:firebase/core/services/firebase_services/auth/auth_sign_up.dart';

class SignUpController extends GetxController {
  AuthSignUp authSignUp;
  SignUpController({required this.authSignUp});
  final isLoading = false.obs;

  ///signUp method
  signUp({required String email, required String password}) async {
    try {
      isLoading.value = true;
      await authSignUp.signUp(email: email, password: password);
      OverlayHelper.showSuccessToast(
        Get.overlayContext!,
        "Registered successfully!",
      );
      Get.offAllNamed(signInPath);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        OverlayHelper.showWarningToast(
          Get.overlayContext!,
          'The password provided is too weak',
        );
      } else if (e.code == 'email-already-in-use') {
        OverlayHelper.showWarningToast(
          Get.overlayContext!,
          'The account already exists for that email',
        );
      }
    } catch (e) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        e.toString(),
      );
    }
    isLoading.value = false;
  }
}
