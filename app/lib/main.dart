import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:professorfc_app/features/home/presentation/pages/home_page.dart';
import 'package:professorfc_app/setup.dart';

void main() async {
  await setup();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(context, "Arial"),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
