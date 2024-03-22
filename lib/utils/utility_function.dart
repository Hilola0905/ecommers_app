
import 'package:ecommers_app/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

showSnackbar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.orangeAccent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyle.interSemiBold
            .copyWith(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}

showErrorForRegister(
    String code,
    BuildContext context,
    ) {
  if (code == 'weak-password') {
    debugPrint('The password provided is too weak.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Passwordni xato kiritdingiz",
    );
  } else if (code == 'email-already-in-use') {
    debugPrint('The account already exists for that email.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Bu e-pochta uchun hisob allaqachon mavjud.",
    );
  }
}

showErrorForLogin(
    String code,
    BuildContext context,
    ) {
  if (code == 'wrong-password') {
    debugPrint('The password provided is wrong.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Passwordni xato kiritdingiz",
    );
  } else if (code == 'invalid-email') {
    debugPrint('The e-mail is invalid.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Bu e-pochta yaqroqsiz.",
    );
  } else if (code == 'user-disabled') {
    debugPrint('The user is blocked.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Foydalanuvchi bloklangan.",
    );
  } else {
    debugPrint('The user is not found.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Foydalanuvchi topilmadi.",
    );
  }
}



 alertDialog(BuildContext context,VoidCallback onTap){
   return AlertDialog(
     title : const  Text(" realy sign out "),
     actions: [
       TextButton(
           onPressed: onTap,
           child: const Text("ok",style: TextStyle(
           fontWeight: FontWeight.w500,
           fontSize: 18
       ),)),
       TextButton(onPressed: (){
         Navigator.of(context).pop();
       }, child: const Text("cancel",style: TextStyle(
           fontWeight: FontWeight.w500,
           fontSize: 18
       ),
       ),
       ),
     ],
   );
 }
