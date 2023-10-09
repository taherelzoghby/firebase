import 'dart:io';

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
            hint: 'car name',
            onChanged: (String value) => controller.changeName(value),
          ),
          SizedBox(height: size.height * .01),
          CustomTextField(
            hint: 'car model',
            onChanged: (String value) => controller.changeModel(value),
          ),
          SizedBox(height: size.height * .01),
          CustomTextField(
            hint: 'car color',
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
                          'assets/images/photo.png',
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
              text: 'submit',
              onTap: () => controller.submit(),
            ),
          ),
        ],
      ),
    );
  }
}
