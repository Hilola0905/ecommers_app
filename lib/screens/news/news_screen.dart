
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../data/provider/api_provider.dart';
import '../../services/local_notifacation_service.dart';
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int id = 1;

  _init() async {
    FirebaseMessaging.instance.subscribeToTopic("news");

    FirebaseMessaging.instance.unsubscribeFromTopic("news");

    String? fcmTome = await FirebaseMessaging.instance.getToken();
    debugPrint("FCM TOKEN:$fcmTome");
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      if (remoteMessage.notification != null) {
        LocalNotificationService().showNotification(
          title: remoteMessage.notification!.title!,
          body: remoteMessage.notification!.body!,
          id: id,
        );
      }
      debugPrint(
          "FOREGROUND MODE DA PUSH NOTIFICATION KELDI:${remoteMessage.notification!.title}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      if (remoteMessage.notification != null) {
        debugPrint(
            "TERMINATED MODE DA PUSH NOTIFICATION KELDI:${remoteMessage.notification!.title}");
      }
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                  onPressed:() async {
                    String messageId = await ApiProvider().sendNotificationToUsers(
                      title: "vbnmkjhg",
                      body: "dascription",
                    );
                    LocalNotificationService().showNotification(
                      title: "Hello everyOne",
                      body: "fghjkl;lkjhgfdxs",
                      id: 12,
                    );
                    ApiProvider().readNotification(
                        title: "",
                        body: "ghjklmnbvgcf"
                    );
                  },
                  child: Text("send"),
              ),
            )
          ],
        ));
  }
}
