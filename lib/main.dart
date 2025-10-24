import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/core/controller/c_home.dart';
import 'package:momo/prsentation/screens/explore/controllers/explore_controller.dart';
import 'package:momo/prsentation/screens/home_page.dart';
import 'package:momo/prsentation/screens/one_shot/controller/oneshot_controller.dart';
import 'package:momo/test.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CHome>(create: (_)=>CHome()),
        ChangeNotifierProvider<CExplore>(create: (_)=>CExplore()),
        ChangeNotifierProvider<COneShot>(create: (_)=>COneShot()),
      ],
    child: MyApp()
    ),
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      // themeMode: ThemeMode.light,
      // theme: ThemeData(

      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      home: const HomePage(),
    );
  }
}


