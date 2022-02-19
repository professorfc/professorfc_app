import 'package:custom_view/custom_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:professorfc_app/config/analytics_service.dart';
import 'package:professorfc_app/features/home/presentation/pages/home_page.dart';
import 'package:professorfc_app/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await MobileAds.instance.initialize();
  await Firebase.initializeApp();

  await setup();
  setupRoot();

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
      navigatorObservers: [
        getItInstance<AnalyticsService>().getAnalyticsObserver(),
      ],
    );
  }
}
