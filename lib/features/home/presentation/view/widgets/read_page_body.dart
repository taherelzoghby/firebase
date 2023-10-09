import 'package:firebase/core/widgets/empty.dart';
import 'package:firebase/core/widgets/loading_widget.dart';
import 'package:firebase/features/home/presentation/view/widgets/item.dart';
import 'package:firebase/features/home/presentation/view_model/read_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadPageBody extends StatelessWidget {
  const ReadPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ReadController>(
      init: ReadController(),
      builder: (cont) {
        return cont.isLoading.value
            ? const LoadingWidget()
            : cont.cars.isEmpty
                ? const EmptyWidget()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Item(car: cont.cars[index]);
                    },
                    itemCount: cont.cars.length,
                  );
      },
    );
  }
}
