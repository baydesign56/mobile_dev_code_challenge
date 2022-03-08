// To parse this JSON data, do
//
//     final modelListChat = modelListChatFromJson(jsonString);

import 'dart:convert';

ModelListChat modelListChatFromJson(String str) =>
    ModelListChat.fromJson(json.decode(str));

String modelListChatToJson(ModelListChat data) => json.encode(data.toJson());

class ModelListChat {
  ModelListChat({
    this.data,
  });

  List<Datum>? data;

  factory ModelListChat.fromJson(Map<String, dynamic> json) => ModelListChat(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.body,
    this.attachment,
    this.timestamp,
    this.from,
    this.to,
  });

  int? id;
  String? body;
  String? attachment;
  // DateTime? timestamp;
  String? timestamp;
  String? from;
  String? to;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        body: json["body"],
        attachment: json["attachment"],
        // timestamp: DateTime.fromMillisecondsSinceEpoch(int.tryParse(
        //   json["timestamp"],
        // )!),
        timestamp: json['timestamp'],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "attachment": attachment,
        "timestamp": timestamp,
        "from": from,
        "to": to,
      };
}

var a = [
  [
    [
      {
        "id": 1,
        "body": "pesan pertama",
        "attachment": null,
        "timestamp": "03-54-5446",
        "from": "A",
        "to": "B"
      }
    ],
    [
      {
        "id": 2,
        "body": "gambar pertama",
        "attachment": "image",
        "timestamp": "03-54-5446",
        "from": "A",
        "to": "B"
      }
    ],
    [
      {
        "id": 3,
        "body": null,
        "attachment": "image",
        "timestamp": "03-54-5446",
        "from": "A",
        "to": "B"
      },
      {
        "id": 4,
        "body": null,
        "attachment": "image",
        "timestamp": "03-54-5446",
        "from": "A",
        "to": "B"
      },
      {
        "id": 5,
        "body": null,
        "attachment": "image",
        "timestamp": "03-54-5446",
        "from": "B",
        "to": "A"
      }
    ],
    [
      {
        "id": 6,
        "body": "pesan kedua",
        "attachment": null,
        "timestamp": "03-54-5446",
        "from": "B",
        "to": "A"
      }
    ]
  ],
  [
    [
      {
        "id": 7,
        "body": null,
        "attachment": "contact",
        "timestamp": "03-54-5447",
        "from": "A",
        "to": "B"
      },
      {
        "id": 8,
        "body": null,
        "attachment": "contact",
        "timestamp": "03-54-5447",
        "from": "A",
        "to": "B"
      }
    ]
  ],
  [
    [
      {
        "id": 9,
        "body": null,
        "attachment": "contact",
        "timestamp": "03-56-563",
        "from": "A",
        "to": "B"
      },
      {
        "id": 10,
        "body": null,
        "attachment": "contact",
        "timestamp": "03-56-563",
        "from": "A",
        "to": "B"
      },
      {
        "id": 11,
        "body": null,
        "attachment": "contact",
        "timestamp": "03-56-563",
        "from": "A",
        "to": "B"
      }
    ]
  ],
  [
    [
      {
        "id": 12,
        "body": "pesan ketiga",
        "attachment": null,
        "timestamp": "03-56-567",
        "from": "A",
        "to": "B"
      }
    ],
    [
      {
        "id": 13,
        "body": "pesan keempat",
        "attachment": null,
        "timestamp": "03-56-567",
        "from": "B",
        "to": "A"
      }
    ]
  ],
  [
    [
      {
        "id": 14,
        "body": "pesan kelima",
        "attachment": null,
        "timestamp": "03-56-568",
        "from": "A",
        "to": "B"
      }
    ]
  ],
  [
    [
      {
        "id": 15,
        "body": null,
        "attachment": "document",
        "timestamp": "03-56-5610",
        "from": "A",
        "to": "B"
      }
    ],
    [
      {
        "id": 16,
        "body": null,
        "attachment": "image",
        "timestamp": "03-56-5610",
        "from": "B",
        "to": "A"
      }
    ]
  ],
  [
    [
      {
        "id": 17,
        "body": null,
        "attachment": "image",
        "timestamp": "03-57-5730",
        "from": "B",
        "to": "A"
      },
      {
        "id": 18,
        "body": null,
        "attachment": "image",
        "timestamp": "03-57-5730",
        "from": "B",
        "to": "A"
      },
      {
        "id": 19,
        "body": null,
        "attachment": "image",
        "timestamp": "03-57-5730",
        "from": "B",
        "to": "A"
      }
    ]
  ],
  [
    [
      {
        "id": 20,
        "body": "pesan kelima",
        "attachment": null,
        "timestamp": "03-57-5737",
        "from": "B",
        "to": "A"
      }
    ],
    [
      {
        "id": 21,
        "body": "gambar kedua",
        "attachment": "image",
        "timestamp": "03-57-5737",
        "from": "A",
        "to": "B"
      }
    ]
  ],
  [
    [
      {
        "id": 22,
        "body": null,
        "attachment": "contact",
        "timestamp": "03-57-5738",
        "from": "A",
        "to": "B"
      },
      {
        "id": 23,
        "body": null,
        "attachment": "contact",
        "timestamp": "03-57-5738",
        "from": "A",
        "to": "B"
      },
      {
        "id": 24,
        "body": null,
        "attachment": "contact",
        "timestamp": "03-57-5738",
        "from": "A",
        "to": "B"
      },
      {
        "id": 25,
        "body": null,
        "attachment": "contact",
        "timestamp": "03-57-5738",
        "from": "A",
        "to": "B"
      }
    ]
  ],
  [
    [
      {
        "id": 26,
        "body": null,
        "attachment": "image",
        "timestamp": "03-57-5740",
        "from": "A",
        "to": "B"
      }
    ]
  ],
  [
    [
      {
        "id": 27,
        "body": null,
        "attachment": "image",
        "timestamp": "03-58-5855",
        "from": "A",
        "to": "B"
      },
      {
        "id": 28,
        "body": null,
        "attachment": "image",
        "timestamp": "03-58-5855",
        "from": "A",
        "to": "B"
      },
      {
        "id": 29,
        "body": null,
        "attachment": "image",
        "timestamp": "03-58-5855",
        "from": "A",
        "to": "B"
      },
      {
        "id": 30,
        "body": null,
        "attachment": "image",
        "timestamp": "03-58-5855",
        "from": "A",
        "to": "B"
      }
    ]
  ],
  [
    [
      {
        "id": 31,
        "body": "gambar ketiga",
        "attachment": "image",
        "timestamp": "03-58-5859",
        "from": "A",
        "to": "B"
      }
    ]
  ]
];
