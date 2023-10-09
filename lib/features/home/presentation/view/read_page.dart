import 'package:firebase/core/consts/strings.dart';
import 'package:firebase/features/home/presentation/view/widgets/read_page_body.dart';
import 'package:firebase/features/home/presentation/view_model/read_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  void initState() {
    Get.put(ReadController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.read),
        centerTitle: true,
      ),
      body: const ReadPageBody(),
    );
  }
}
