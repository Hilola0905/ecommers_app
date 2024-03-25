import 'package:ecommers_app/data/local/image_data.dart';
import 'package:ecommers_app/screens/auth/widgets/text_feild_item.dart';
import 'package:ecommers_app/utils/contacts/app_contacts.dart';
import 'package:ecommers_app/view_models/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../utils/images/app_images.dart';
import '../../utils/size/screen_utils.dart';
import '../../utils/style/app_text_style.dart';

class UpdateCategoryScreen extends StatefulWidget {
  const UpdateCategoryScreen({super.key});

  @override
  State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
}
int activeIndex=0;
class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {
  final TextEditingController nameController = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light
        ),
        title: const  Center(child: Text("Update Category ")),
      ),
      resizeToAvoidBottomInset: false,
      body:
      Padding(
        padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(categoryImage.length, (index) =>
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.network(categoryImage[index],fit: BoxFit.cover,),
                        ),
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(categoryImage.length, (index) =>
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: activeIndex==index?Colors.green : Colors.grey,
                        ),
                      )
                  ),

                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h,),
                    Text(
                      "Category Name",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.interSemiBold.copyWith(
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.7)
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    TextFieldItem(
                        exp: AppConstants.textRegExp,
                        hintText: "Name",
                        controller: nameController,
                        isPassword: false,
                        errorText: "This user name is not full"
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
                          "Update category",
                          style: AppTextStyle.interSemiBold
                              .copyWith(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
            ),

          ],
        ),
      )
      ,
    );
  }
}
