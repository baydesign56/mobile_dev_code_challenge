import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_ussho/screens/components/bubble_chat.dart';

Widget cardChat(var finish) {
  var data = json.decode(finish);
  return Container(
    color: Colors.white,
    // margin: const EdgeInsets.all(15),
    child: Column(
      children: [
        for (var i = 0; i < data.length; i++)
          Container(
            // margin: EdgeInsets.all(15),
            color: Colors.transparent,
            child: itemCardChar(
              data[i],
            ),
          )
      ],
    ),
  );
}

Widget itemCardChar(List<dynamic> data) {
  log(data.toString());

  for (var i = 0; i < data.length; i++) {
    if (data[i]["attachment"] == "image" &&
        data[i]["body"] == null &&
        data[i]["from"] == "A") {
      return Align(
        alignment: Alignment.centerLeft,
        child: bubbleChat(
            Container(
              constraints: const BoxConstraints(minWidth: 60, maxWidth: 180),
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (var i = 0; i < data.length; i++) isImage(),
                ],
              ),
            ),
            data[i]["from"]),
      );
    } else if (data[i]["attachment"] == "image" &&
        data[i]["body"] == null &&
        data[i]["from"] == "B") {
      return Align(
        alignment: Alignment.centerRight,
        child: bubbleChat(
            Container(
              color: Colors.transparent,
              constraints: const BoxConstraints(minWidth: 60, maxWidth: 180),
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (var i = 0; i < data.length; i++) isImage(),
                ],
              ),
            ),
            data[i]["from"]),
      );
    } else if (data[i]["attachment"] == "document") {
      return Align(
          alignment: data[i]["from"] == "A"
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: bubbleChat(
            Wrap(
              spacing: 5,
              runSpacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(Icons.file_copy),
                Text(data[i]["attachment"].toString()),
              ],
            ),
            data[i]["from"],
          ));
    } else if (data[i]["attachment"] == "contact" && data[i]["body"] == null) {
      return Align(
        alignment: data[i]["from"] == "A"
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: bubbleChat(
          Container(
            color: Colors.transparent,
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle_rounded,
                ),
                Text(data.length.toString() + " Contact"),
              ],
            ),
          ),
          data[i]["from"],
        ),
      );
    } else if (data[i]["body"] != null && data[i]["attachment"] == null) {
      return Align(
          alignment: data[i]["from"] == "A"
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: bubbleChat(
            isTextOnly(data[i]),
            data[i]["from"],
          ));
    } else if (data[i]["body"] != null && data[i]["attachment"] == "image") {
      return Align(
          alignment: data[i]["from"] == "A"
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: bubbleChat(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [isImage(), Text(data[i]["body"])],
            ),
            data[i]["from"],
          ));
    }
  }

  return const Text("unidentified");
}

Widget isTextOnly(dynamic data) {
  return Container(
    color: Colors.transparent,
    child: Text(data["body"]),
  );
}
