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

import '../../data/models/category_model.dart';
import '../../services/local_notifacation_service.dart';
import '../../utils/images/app_images.dart';
import '../../utils/size/screen_utils.dart';
import '../../utils/style/app_text_style.dart';
import '../../view_models/category_view_model.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}
int activeIndex=0;

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();


  @override
  void dispose() {
    urlController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int id1=1;
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light
        ),
        title: Center(child: Text("Add Category ")),
      ),
      resizeToAvoidBottomInset: false,
      body:
      Padding(
        padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                    SizedBox(height: 20.h,),
                    Text(
                      "Category image Url",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.interSemiBold.copyWith(
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.7)
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    TextFieldItem(
                        exp: AppConstants.textRegExp,
                        hintText: "image url",
                        controller: urlController,
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
                        onPressed: () {
                          context.read<CategoriesViewModel>().insertCategory(
                            CategoryModel(
                              imageUrl:
                              "https://static-assets.business.amazon.com/assets/in/24th-jan/705_Website_Blog_Appliances_1450x664.jpg.transform/1450x664/image.jpg",
                              categoryName: nameController.text,
                              docId: "",

                            ),
                            context,
                          );
                          Navigator.pop(context);
                          LocalNotificationService().showNotification(
                            title: "${nameController.text} maxsulot qo'shildi!",
                            body: "Maxsulot haqida ma'lumot olishingiz mumkin.",
                            id: id1,
                          );
                          id1++;
                        },
                        child: Text(
                          "add category",
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
