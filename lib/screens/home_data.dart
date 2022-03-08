import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:test_ussho/controller/controller_chat.dart';
import 'package:collection/collection.dart';
import 'package:test_ussho/models/model_list_chat.dart';

import 'components/card_chat.dart';

class HomeData extends StatefulWidget {
  const HomeData({Key? key}) : super(key: key);

  @override
  _HomeDataState createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  final f = DateFormat('hh-mm-ms');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerChat>(
      builder: (value) {
        /////convert timestamp to string dateformate;
        var data = value.modelListChat!.data!;
        for (var i = 0; i < data.length; i++) {
          data[i].timestamp = f.format(
            DateTime.fromMillisecondsSinceEpoch(
                int.tryParse(data[i].timestamp!)!),
          );
        }

        ////grouby list data by timestamp
        var listTimeStamp = groupBy(data, (Datum obj) {
          return '${obj.timestamp}';
        }).values.toList();
        var finish = [];
        for (var i = 0; i < listTimeStamp.length; i++) {
          ////grouping list in list timestamp by body and attachment
          finish.add(
            json.encode(
              groupBy(
                listTimeStamp[i],
                (Datum p0) => "${p0.body}+${p0.attachment}",
              ).values.toList(),
            ),
          );
        }

        return Scaffold(
            // resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                  )),
              title: Row(
                children: const [
                  Icon(
                    Icons.account_circle,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("A"),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_rounded,
                    ))
              ],
            ),
            body: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 50,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i = 0; i < finish.length; i++)
                        cardChat(finish[i]),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Row(
                    children: [
                      const Flexible(
                          flex: 1,
                          child: SizedBox(
                            width: 50,
                            child: Icon(
                              Icons.attach_file,
                            ),
                          )),
                      Flexible(
                          flex: 10,
                          child: SizedBox(
                            width: Get.width,
                            child: const TextField(
                              decoration:
                                  InputDecoration(hintText: "Send message.."),
                            ),
                          )),
                      const Flexible(
                          flex: 1,
                          child: SizedBox(
                            width: 50,
                            child: Icon(
                              Icons.account_circle_outlined,
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ]));
      },
    );
  }
}
