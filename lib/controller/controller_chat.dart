import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_ussho/models/model_list_chat.dart';
import 'package:test_ussho/services/dio_services.dart';
import 'package:test_ussho/services/error_message.dart';

class ControllerChat extends GetxController {
  bool load = false;
  String? messageError;
  ModelListChat? modelListChat;

  getMessage() async {
    load = true;
    messageError = null;

    update();
    try {
      var response = await DioServices.dio.get(
          "https://raw.githubusercontent.com/okiwicaksono/mobile_dev_code_challenge/master/message_dataset.json");
      if (response.statusCode == 200) {
        load = false;
        log(response.data);
        log(response.statusCode.toString());
        modelListChat = modelListChatFromJson(response.data);
        update();
      } else {
        load = false;
        messageError = response.statusMessage;
        log(response.data);
        log(response.statusCode.toString());
        update();
      }
    } on DioError catch (e) {
      load = false;
      messageError = await errorMessage(e.type);
      update();
    }
  }
}
