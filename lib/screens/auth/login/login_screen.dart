import 'package:ecommers_app/screens/auth/widgets/text_feild_item.dart';
import 'package:ecommers_app/utils/colors/app_colors.dart';
import 'package:ecommers_app/utils/images/app_images.dart';
import 'package:ecommers_app/utils/size/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/contacts/app_contacts.dart';
import '../../../utils/style/app_text_style.dart';
import '../../../view_models/auth_view_model.dart';
import '../../routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return AnnotatedRegion(
     value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: AppColors.cF9F9F9,
         body: Padding(
           padding: EdgeInsets.symmetric(vertical: 40.h,horizontal: 24.w),
           child: ListView(
             children: [
               SizedBox(height: 10.h,),
               Text(
             "Welcome to shopping app",
             textAlign: TextAlign.center,
             style: AppTextStyle.interSemiBold.copyWith(
               fontSize: 28,
               color: Colors.deepOrange
             ),
             ),
               SizedBox(height: 24.h,),
               Text(
                 "LOGIN",
                 textAlign: TextAlign.center,
                 style: AppTextStyle.interSemiBold.copyWith(
                   fontSize: 24,
                 ),
               ),
               SizedBox(height: 24.h,),
               TextFieldItem(
                   exp: AppConstants.emailRegExp,
                   hintText: "Email",
                   controller: emailController,
                   isPassword: false,
                   errorText: "please enter the full password",

               ),
               SizedBox(height: 24.h,),
               TextFieldItem(
                   exp: AppConstants.passwordRegExp,
                   hintText: "password",
                   controller: passwordController,
                   isPassword: true,
                   errorText: "please enter the full password"
               ),
               SizedBox(height: 24.h,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   TextButton(
                       onPressed: (){
                         Navigator.pushReplacementNamed(
                           context,
                           RouteNames.registerRoute,
                         );
                       },
                       child: Text(
                         "you do not have account?",
                         textAlign: TextAlign.end,
                         style: AppTextStyle.interSemiBold.copyWith(
                           fontSize: 12,
                           color: Colors.deepOrange
                         ),
                       ),
                   ),
                 ],
               ),
               SizedBox(height: 24.h,),
               SizedBox(
                 height: 50,
                 width: double.infinity,
                 child: TextButton(
                   style: TextButton.styleFrom(
                       backgroundColor: Colors.orange,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(16))),
                   onPressed: () {
                     context.read<AuthViewModel>().loginUser(
                         context,
                         email: emailController.text,
                         password: passwordController.text
                     );
                   },
                   child: Text(
                     "LOGIN",
                     style: AppTextStyle.interSemiBold
                         .copyWith(fontSize: 18, color: Colors.white),
                   ),
                 ),
               ),
               SizedBox(height: 90.h,),
               Text(
                 "Or sign up with social account",
                 textAlign: TextAlign.center,
                 style: AppTextStyle.interSemiBold.copyWith(
                     fontSize: 12,
                     color: Colors.deepOrange
                 ),
               ),
               SizedBox(height: 24.h,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   InkWell(
                     borderRadius: BorderRadius.circular(12),
                     onTap: (){},
                     child: Container(
                       padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color: Colors.white,
                       ),
                       child: SvgPicture.asset(AppImages.google),
                     ),
                   ),
                   SizedBox(width: 20.w,),
                   InkWell(
                     borderRadius: BorderRadius.circular(12),
                     onTap: (){},
                     child: Container(
                       padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color: Colors.white,
                       ),
                       child: SvgPicture.asset(AppImages.facebook),
                     ),
                   ),
                 ],
               ),

             ],
           ),
         ),
      ),
    );
  }
}
