import 'package:flutter/material.dart';
import 'package:flutter_get/base/app_base.dart';
import 'package:flutter_get/constants/app_route.dart';
import 'package:flutter_get/constants/app_string.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AppBase {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => buildScreen();

  Widget buildScreen() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appBarHome),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /* InkWell(
                    child: const Text(
                      AppStrings.welcomeMessage,
                    ),
                    onTap: () => Get.toNamed(AppRoutes.profile),
                  ), */
                  buildButton('SnakeBar', 1),
                  buildButton('Dialog', 2),
                  buildButton('BottomSheet', 3),
                  buildButton('Go to profile', 4),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildButton(String text, int idx) => Container(
        margin: const EdgeInsets.fromLTRB(0, 25, 0, 8),
        child: ElevatedButton(
          onPressed: () {
            idx == 1
                ? showSnackBar()
                : idx == 2
                    ? showDialog()
                    : idx == 3
                        ? showBottomSheet()
                        : Get.toNamed(AppRoutes.profile);
          },
          child: Text(
            text,
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
            textStyle: const TextStyle(fontSize: 22.0),
          ),
        ),
      );

  showDialog() {
    Get.defaultDialog(
      title: 'FLUTTER GET X',
      titleStyle: const TextStyle(fontWeight: FontWeight.w500),
      content: Column(
        children: const [
          Text(
            'This is content one',
            style: TextStyle(color: Colors.blueGrey),
          ),
        ],
      ),
      middleText: 'Get X made easy',
      textConfirm: 'Yes',
      confirmTextColor: Colors.black,
      buttonColor: Colors.transparent,
      onConfirm: () => {
        showToast('Click Yes'),
        Get.back(),
      },
    );
  }

  showBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20.0),
        height: 200.0,
        color: Colors.blue,
        child: Column(
          children: [
            const Text('This is Bottom sheet'),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                showToast('Click OK');
                Get.back();
              },
              child: const Text(
                'OK',
              ),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                textStyle: const TextStyle(fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }
}
