import 'package:ecommers_app/screens/routes.dart';
import 'package:ecommers_app/utils/images/app_images.dart';
import 'package:ecommers_app/utils/size/screen_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../utils/style/app_text_style.dart';
import '../../../view_models/auth_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user=context.watch<AuthViewModel>().getUser;
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light
      ),
      child: Scaffold(
         body:user != null
             ? context.watch<AuthViewModel>().loading
             ? const Center(child: CircularProgressIndicator()):
             Padding(
           padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 24.w),
            child: Column(
             children: [
               SizedBox(height: 10.h,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "My Profile",
                     textAlign: TextAlign.center,
                     style: AppTextStyle.interSemiBold.copyWith(
                         fontSize: 28,
                     ),
                   ),
                   IconButton(
                     onPressed: ()   {
                      showDialog(context: context, builder: (context){
                        return  AlertDialog(
                          title : const  Text(" really sign out "),
                          actions: [
                            TextButton(
                                onPressed:(){
                                  context.read<AuthViewModel>().logout(context);
                                },
                                child: const Text("ok",style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18
                                ),)),
                            TextButton(onPressed: (){
                              Navigator.of(context).pop();
                            },
                              child: const Text("cancel",style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18
                              ),
                              ),
                            ),
                          ],
                        );

                      });
                     },
                     icon: const Icon(Icons.logout),
                   ),
                 ],
               ),
               Row(
                 children: [
                   SizedBox(
                     width: width/2,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(50.w),
                       child: Image.asset(AppImages.girl,fit: BoxFit.cover,),
                     ),
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(
                         user.displayName.toString(),
                         style:
                         AppTextStyle.interSemiBold.copyWith(fontSize: 12),
                       ),
                       SizedBox(height: 12.h),
                       Text(
                         user.email.toString(),
                         style:
                         AppTextStyle.interSemiBold.copyWith(fontSize: 8),
                       ),
                       SizedBox(height: 12.h),

                     ],
                   ),
                 ],
               ),
               Row(
                 children: [
                   Text(
                     "Settings",
                     textAlign: TextAlign.center,
                     style: AppTextStyle.interSemiBold.copyWith(
                       fontSize: 22,
                     ),
                   ),
                  SizedBox(width: 12.w,),
                  const  Icon(Icons.settings),
                 ],
               ),
               SizedBox(height: 8.h,),
               Container(
                 width: width,
                 height: 1,
                 color: Colors.black.withOpacity(0.3),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Update profile data",
                     textAlign: TextAlign.center,
                     style: AppTextStyle.interSemiBold.copyWith(
                       fontSize: 20,
                       color: Colors.black.withOpacity(0.7)
                     ),
                   ),
                   IconButton(
                     onPressed: ()   {
                       Navigator.pushNamed(context, RouteNames.updateProfileRoute);
                     },
                     icon: const Icon(Icons.edit),
                   ),
                 ],
               ),
               SizedBox(height: 8.h,),
               Container(
                 width: width,
                 height: 1,
                 color: Colors.black.withOpacity(0.3),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Light",
                     textAlign: TextAlign.center,
                     style: AppTextStyle.interSemiBold.copyWith(
                         fontSize: 20,
                         color: Colors.black.withOpacity(0.7)
                     ),
                   ),
                   Switch(
                     activeColor: Colors.purple,
                     inactiveTrackColor: Colors.grey,
                     value: false,
                     onChanged: (v) {
                     },
                   )
                 ],
               ),
               SizedBox(height: 8.h,),
               Container(
                 width: width,
                 height: 1,
                 color: Colors.black.withOpacity(0.3),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Column(
                     children: [
                       SizedBox(height: 8.h,),
                       Text(
                         "Language",
                         textAlign: TextAlign.center,
                         style: AppTextStyle.interSemiBold.copyWith(
                             fontSize: 20,
                             color: Colors.black.withOpacity(0.7)
                         ),
                       ),
                     ],
                   ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: "uzb",
                                  groupValue: "uzb",
                                  onChanged: (value){
                                    print("ontap");
                                  }),
                              Text(
                                "uzb",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.interSemiBold.copyWith(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.7)
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "eng",
                                  groupValue: true,
                                  onChanged: (value){
                                    print("ontap");
                                  }),
                              Text(
                                "eng",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.interSemiBold.copyWith(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.7)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                 ],
               ),
               Container(
                 width: width,
                 height: 1,
                 color: Colors.black.withOpacity(0.3),
               ),
             ],
           ),
         ):
         const Center(
           child: Text("USER NOT EXIST"),
         ),
      ),
    );
  }
}
