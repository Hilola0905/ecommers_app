import 'dart:convert';
import 'dart:io';
import 'package:ecommers_app/data/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../services/local_notifacation_service.dart';

class ApiProvider {
  Future<String> sendNotificationToUsers({
    String? topicName,
    String? fcmToken,
    String? imageUrl,
    String? description,
    String? categoryDocId,
    required String title,
    required String body,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: {
          "Authorization":
          "key=eRvIawrIRxedDXLumO897R:APA91bEi0GP7Fk7psTOTFxGwyHj1h9zmhd1qLgayQGrgaABnczXUmjuxSaXYLGmedIyAWybRI20AorPOmXIyqWHzuFxs4frUFjmshA7lWqTYyyoCWHCAeobznXbBjnwGyR9qRJ3-QWqp",
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "to": topicName != null ? "/topics/$topicName" : fcmToken,
            "notification": {
              "title": title,
              "body": body,
              "sound": "default",
              "priority": "max"
            },
            "data": {
              "image_url": imageUrl ??
                  "https://top.uz/upload/iblock/0de/0dec725e4583a0698a8732ca646a4994.png",

              "book_description": description ??
                  "Finland's national carrier Finnair has started weighing passengers on its flights from the capital city of Helsinki. The weigh-ins are being done on a voluntary basis and are completely anonymous. A company spokesperson said the new initiative is to ensure safety standards on flights are adhered to. He said any airplane should not exceed the prescribed maximum weight for safe take-offs and landings.",
              "category_doc_id": categoryDocId ?? ""
            }
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        debugPrint("DATA:${response.body}");
        return response.body.toString();
      }
    } catch (err) {
      debugPrint(err.toString());
    }

    return "ERROR";
  }
  Future<Object> readNotification({
    String? topicName,
    String? fcmToken,
    String? imageUrl,
    String? description,
    String? categoryDocId,
    required String title,
    required String body,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: {
          "Authorization":
          "key=eRvIawrIRxedDXLumO897R:APA91bEi0GP7Fk7psTOTFxGwyHj1h9zmhd1qLgayQGrgaABnczXUmjuxSaXYLGmedIyAWybRI20AorPOmXIyqWHzuFxs4frUFjmshA7lWqTYyyoCWHCAeobznXbBjnwGyR9qRJ3-QWqp",
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == HttpStatus.ok) {
       ProductModel  product= ProductModel.fromJson(response.body as Map<String, dynamic>);
        debugPrint("DATA:${response.body}");


      }
    } catch (err) {
      debugPrint(err.toString());
    }

    return "ERROR";
  }
}
