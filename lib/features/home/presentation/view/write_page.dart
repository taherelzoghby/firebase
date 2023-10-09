import 'package:firebase/features/home/presentation/view/widgets/write_page_body.dart';
import 'package:firebase/features/home/presentation/view_model/write_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePage extends StatelessWidget {
  const WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WriteController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('write'),
        centerTitle: true,
      ),
      body: const WritePageBody(),
    );
  }
}
