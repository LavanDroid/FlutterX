import 'package:flutter/material.dart';
import 'package:flutter_get/constants/app_string.dart';
import 'package:get/get.dart';

import 'constants/app_constants.dart';
import 'constants/app_route.dart';
import 'routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.applicationTitle,
      defaultTransition: Transition.rightToLeft,
      transitionDuration:  const Duration(milliseconds: AppConstants.appTransitionDuration),
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'verdana',
      ),
      initialRoute: AppRoutes.initial,
      getPages: RouteGenerator.routes,
      //home: const MyHomePage(),
    );
  }
}
