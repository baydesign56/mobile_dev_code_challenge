import 'package:flutter/material.dart';

Widget bubbleChat(Widget widget, String form) {
  return Container(
    constraints: const BoxConstraints(
      minWidth: 60,
    ),
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: form == "A" ? Colors.grey.withOpacity(0.2) : Colors.grey,
      borderRadius: BorderRadius.circular(5),
    ),
    child: widget,
  );
}

Widget isImage() {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    child: const Icon(Icons.image),
  );
}
