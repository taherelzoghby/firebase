// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase/core/consts/route.dart';
import 'package:firebase/core/helper/overlay_helper.dart';
import 'package:get/get.dart';

import 'package:firebase/core/services/firebase_services/auth/auth_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInController extends GetxController {
  AuthSignIn authSignIn;
  SignInController({required this.authSignIn});
  final isLoading = false.obs;

  ///signIn method
  signIn({required String email, required String password}) async {
    try {
      isLoading.value = true;
      await authSignIn.signIn(email: email, password: password);
      OverlayHelper.showSuccessToast(
        Get.overlayContext!,
        "Login successfully!",
      );
      Get.offAllNamed(homePath);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        OverlayHelper.showWarningToast(
          Get.overlayContext!,
          'No user found for that email',
        );
      } else if (e.code == 'wrong-password') {
        OverlayHelper.showWarningToast(
          Get.overlayContext!,
          'Wrong password provided for that user',
        );
      }
    }
    isLoading.value = false;
  }
}
