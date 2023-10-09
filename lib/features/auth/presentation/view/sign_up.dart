// ignore_for_file: use_build_context_synchronously

import 'package:firebase/core/consts/route.dart';
import 'package:firebase/core/consts/style.dart';
import 'package:firebase/core/services/firebase_services/auth/auth_sign_up.dart';
import 'package:firebase/core/widgets/customButton.dart';
import 'package:firebase/core/widgets/text_form_field.dart';
import 'package:firebase/features/auth/presentation/view_model/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController(authSignUp: AuthSignUp()));
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppConsts.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => ModalProgressHUD(
            inAsyncCall: controller.isLoading.value,
            opacity: 0,
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: height * .2),
                  const Center(
                    child: Text(
                      'SIGNUP',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppConsts.mainColor,
                      ),
                    ),
                  ),
                  SizedBox(height: height * .05),
                  CustomTextFormField(
                    hint: 'Email',
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(height: height * .02),
                  CustomTextFormField(
                    hint: 'Password',
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(height: height * .06),
                  AspectRatio(
                    aspectRatio: .5 / .07,
                    child: CustomButton(
                      text: 'sign up',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await controller.signUp(
                            email: email,
                            password: password,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have an acount?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () => Get.offAllNamed(signInPath),
                        child: const Text(
                          'sign in',
                          style: TextStyle(color: AppConsts.mainColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
