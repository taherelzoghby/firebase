import 'dart:io';

import 'package:firebase/core/consts/assets.dart';
import 'package:firebase/core/consts/strings.dart';
import 'package:firebase/core/consts/style.dart';
import 'package:firebase/core/widgets/customButton.dart';
import 'package:firebase/core/widgets/text_field.dart';
import 'package:firebase/features/home/presentation/view_model/write_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePageBody extends StatelessWidget {
  const WritePageBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WriteController>();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          CustomTextField(
            hint: Strings.carName,
            onChanged: (String value) => controller.changeName(value),
          ),
          SizedBox(height: size.height * .01),
          CustomTextField(
            hint: Strings.carModel,
            onChanged: (String value) => controller.changeModel(value),
          ),
          SizedBox(height: size.height * .01),
          CustomTextField(
            hint: Strings.carColor,
            onChanged: (String value) => controller.changeColor(value),
          ),
          SizedBox(height: size.height * .01),
          Obx(
            () => InkWell(
              onTap: () => controller.selectedImageFromGallary(),
              child: Container(
                height: size.height * .2,
                width: size.width,
                decoration: AppConsts.decorationImage,
                child: controller.image.value.isEmpty
                    ? Center(
                        child: Image.asset(
                          AppAssets.addImage,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Image.file(File(controller.image.value)),
              ),
            ),
          ),
          SizedBox(height: size.height * .05),
          AspectRatio(
            aspectRatio: .5 / .07,
            child: CustomButton(
              text: Strings.submit,
              onTap: () => controller.submit(),
            ),
          ),
        ],
      ),
    );
  }
}
