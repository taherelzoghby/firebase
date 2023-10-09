import 'package:firebase/core/consts/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Get.toNamed(writePagePath),
            child: const Text('write'),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed(readPagePath),
            child: const Text('read'),
          ),
        ],
      ),
    );
  }
}
