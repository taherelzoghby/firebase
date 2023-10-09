import 'package:firebase/core/consts/style.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: AppConsts.grey.withOpacity(.3)),
        const CircularProgressIndicator(),
      ],
    );
  }
}
