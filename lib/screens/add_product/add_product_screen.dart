import 'package:ecommers_app/utils/size/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/local/image_data.dart';
import '../../data/models/product_model.dart';
import '../../services/local_notifacation_service.dart';
import '../../utils/contacts/app_contacts.dart';
import '../../utils/style/app_text_style.dart';
import '../../view_models/product_view_model.dart';
import '../auth/widgets/text_feild_item.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key,});
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}
int activeIndex=0;
class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();

  @override
  void dispose() {
   productNameController.dispose();
   productPriceController.dispose();
   productDescriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light
        ),
        title: const  Center(child: Text("Add Product ")),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 14.h,horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name",
              textAlign: TextAlign.center,
              style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7)
              ),
            ),
            SizedBox(height: 8.h,),
            TextFieldItem(
                exp: AppConstants.textRegExp,
                hintText: "name",
                controller: productNameController,
                isPassword: false,
                errorText: "This product name is not full"
            ),
            SizedBox(height: 8.h,),
            Text(
              "Product price",
              textAlign: TextAlign.center,
              style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7)
              ),
            ),
            SizedBox(height: 8.h,),
            TextFieldItem(
                exp: AppConstants.textRegExp,
                hintText: "price",
                controller:productPriceController,
                isPassword: false,
                errorText: "This product price is not full"
            ),
            SizedBox(height: 8.h,),
            Text(
              "Product description",
              textAlign: TextAlign.center,
              style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7)
              ),
            ),
            SizedBox(height: 8.h,),
            TextFieldItem(
                exp: AppConstants.textRegExp,
                hintText: "description",
                controller: productDescriptionController,
                isPassword: false,
                errorText: "This product price is not full"
            ),
            SizedBox(height: 30.h,),
            Expanded(

              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(8, (index) =>
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey
                          ),
                          color: activeIndex==index?Colors.green : Colors.grey,
                        ),
                        child: const Center(
                          child: Text("category"),
                        ),
                      )
                  ),

                ],
              ),
            ),
            SizedBox(height: 30.h,),
            Expanded(
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
            SizedBox(height: 30.h,),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: (){
                  context.read<ProductsViewModel>().insertProducts(
                    ProductModel(
                      price: 12.5,
                      imageUrl:
                      "https://i.ebayimg.com/images/g/IUMAAOSwZGBkTR-K/s-l400.png",
                      productName: productNameController.text,
                      docId: "",
                      productDescription: productDescriptionController.text,
                      categoryId: "kcggCJzOEz7gH1LQy44x",
                    ),
                    context,
                  );
                  Navigator.pop(context);
                  LocalNotificationService().showNotification(
                    title: "${productNameController.text} nomga add bo'ldi!",
                    body: "Maxsulot haqida ma'lumot olishingiz mumkin.",
                    id: 8,
                  );
                },
                child: Text(
                  "Add",
                  style: AppTextStyle.interSemiBold
                      .copyWith(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
