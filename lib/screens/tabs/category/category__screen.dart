import 'package:ecommers_app/screens/routes.dart';
import 'package:ecommers_app/screens/tabs/category/widgets/category_item.dart';
import 'package:ecommers_app/utils/size/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category_model.dart';
import '../../../view_models/category_view_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        title: const Text("Category",style: TextStyle(
          fontSize: 20,
        ),),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, RouteNames.addCategoryRoute);
              },
              icon: Icon(Icons.add)
          )
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoriesViewModel>().listenCategories(),
        builder: (context,snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if(snapshot.hasData){
            List<CategoryModel> list = snapshot.data as List<CategoryModel>;
            return  Padding(
              padding:  EdgeInsets.symmetric(vertical: 25.h,horizontal: 10.w),
              child: ListView(
                children: [
                  ...List.generate(list.length, (index) {
                    CategoryModel category = list[index];
                    return CategoryItem(
                      name: category.categoryName,
                      imageUrl: category.imageUrl,
                      onEdit:(){
                        Navigator.pushNamed(context, RouteNames.updatedCategoryRoute);
                      },
                      onDelete: (){
                        showDialog(context: context, builder: (context){
                          return  AlertDialog(
                            title : const  Text(" This category is delete "),
                            actions: [
                              TextButton(
                                  onPressed:(){
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

                    );
                  }


                  ),
                ],
              ),
            );

          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
