import 'package:firebase/core/consts/route.dart';
import 'package:firebase/core/consts/strings.dart';
import 'package:firebase/features/auth/presentation/view/sign_in.dart';
import 'package:firebase/features/home/presentation/view/read_page.dart';
import 'package:firebase/features/home/presentation/view/write_page.dart';
import 'package:firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/auth/presentation/view/sign_up.dart';
import 'features/home/presentation/view/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: signInPath,
      getPages: [
        GetPage(name: signInPath, page: () => SignIn()),
        GetPage(name: signUpPath, page: () => SignUp()),
        GetPage(name: homePath, page: () => const HomePage()),
        GetPage(name: writePagePath, page: () => const WritePage()),
        GetPage(name: readPagePath, page: () => const ReadPage()),
      ],
    );
  }
}
