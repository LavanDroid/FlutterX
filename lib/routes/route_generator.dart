import 'package:flutter_get/base/app_base.dart';
import 'package:flutter_get/constants/app_route.dart';
import 'package:flutter_get/home/home.dart';
import 'package:flutter_get/pages/profile/profile.dart';
import 'package:get/get.dart';

class RouteGenerator {
  //* Singleton logic
  RouteGenerator._privateConstructor();
  static final RouteGenerator _instance = RouteGenerator._privateConstructor();
  factory RouteGenerator() {
    return _instance;
  }

  static final routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const MyHomePage(),
      //middlewares: [MyMiddleware()],
      // transition: Transition.leftToRightWithFade,
      // transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const MyProfilePage(),
      // transition: Transition.leftToRightWithFade,
      // transitionDuration: const Duration(milliseconds: 500),
    ),
  ];

  /* static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR ROUTE'),
          ),
        );
      },
    );
  } */
}

class MyMiddleware extends GetMiddleware with AppBase {
  //* Singleton logic
  MyMiddleware._privateConstructor();
  static final MyMiddleware _instance = MyMiddleware._privateConstructor();
  factory MyMiddleware() {
    return _instance;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    appPrint(page?.name);
    return super.onPageCalled(page);
  }
}
