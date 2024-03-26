import 'package:flutter/cupertino.dart';

import '../services/local_notifacation_service.dart';

class NotificationViewModel extends ChangeNotifier{
  void getNotification(String title,int id) async {
   await LocalNotificationService().showNotification(
  title: title,
  body: "Maxsulot haqida ma'lumot olishingiz mumkin.",
  id: id,
  );
}
}