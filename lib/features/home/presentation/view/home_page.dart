import 'package:firebase/core/consts/strings.dart';
import 'package:firebase/features/home/presentation/view/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
        centerTitle: true,
      ),
      body: const HomeBody(),
    );
  }
}
