import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ussho/controller/controller_chat.dart';
import 'package:test_ussho/screens/components/screen_error.dart';

import 'components/screen_load.dart';
import 'home_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ControllerChat chat = Get.put(ControllerChat());

  getData() {
    chat.getMessage();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerChat>(builder: (value) {
      return value.load
          ? screenLoad()
          : value.messageError != null
              ? screenError(
                  value.messageError ?? "Error",
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      onPressed: getData,
                      child: const Text("Reload"),
                    ),
                  ),
                )
              : const HomeData();
    });
  }
}
