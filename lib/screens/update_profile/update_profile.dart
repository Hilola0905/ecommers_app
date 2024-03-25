import 'package:ecommers_app/screens/auth/widgets/text_feild_item.dart';
import 'package:ecommers_app/utils/contacts/app_contacts.dart';
import 'package:ecommers_app/view_models/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../utils/images/app_images.dart';
import '../../utils/size/screen_utils.dart';
import '../../utils/style/app_text_style.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user=context.watch<AuthViewModel>().getUser;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:user != null
            ? context.watch<AuthViewModel>().loading
            ? const Center(child: CircularProgressIndicator()):
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  SizedBox(
                    width: width/2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.w),
                      child: Image.asset(AppImages.girl,fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
              SizedBox(height: 20.h,),
              Text(
                "New User Name",
                textAlign: TextAlign.center,
                style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.7)
                ),
              ),
              SizedBox(height: 12.h,),
              TextFieldItem(
                  exp: AppConstants.textRegExp,
                  hintText: user.displayName.toString(),
                  controller: userNameController,
                  isPassword: false,
                  errorText: "This user name is not full"
              ),
              SizedBox(height: 20.h,),
              Text(
                "New Email",
                textAlign: TextAlign.center,
                style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.7)
                ),
              ),
              SizedBox(height: 12.h,),
              TextFieldItem(
                  exp: AppConstants.emailRegExp,
                  hintText: user.email.toString(),
                  controller: emailController,
                  isPassword: false,
                  errorText: "This email is not full"
              ),
              SizedBox(height: 50.h,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {},
                  child: Text(
                    "Update",
                    style: AppTextStyle.interSemiBold
                        .copyWith(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ) :
        const Center(
          child: Text("USER NOT EXIST"),
        )
        ,
      ),
    );
  }
}
