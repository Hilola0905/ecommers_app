import 'package:ecommers_app/data/models/product_model.dart';
import 'package:ecommers_app/screens/tabs/product/widgets/product_item.dart';
import 'package:ecommers_app/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../services/local_notifacation_service.dart';
import '../../routes.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light
        ),
        title: const  Center(
          child: Text("Products"),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, RouteNames.addProductRoute);
              },
              icon: Icon(Icons.add)
          )
        ],
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: context.read<ProductsViewModel>().listenProducts(),
        builder: (context,snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if(snapshot.hasData){
            List<ProductModel> products = snapshot.data as List<ProductModel>;
            return   GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                ...List.generate(products.length, (index) {
                  ProductModel product=products[index];
                  return ProductItem(
                    onEdit: () {
                      Navigator.pushNamed(context, RouteNames.updatedProductRoute,arguments: product.docId);
                    },
                    onDelete:  (){
                      showDialog(context: context, builder: (context){
                        return  AlertDialog(
                          title : const  Text(" This product is delete "),
                          actions: [
                            TextButton(
                                onPressed:(){
                                  print(product.docId);
                                  context
                                      .read<ProductsViewModel>()
                                      .deleteProduct(product.docId, context);
                                  Navigator.pop(context);
                                  LocalNotificationService().showNotification(
                                    title: "${product.productName} nomga delete bo'ldi!",
                                    body: "Maxsulot haqida ma'lumot olishingiz mumkin.",
                                    id: 8,
                                  );
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
                    }, onTap: () {
                    Navigator.pushNamed(context, RouteNames.detailProductRoute);
                  }, product: product,

                  );
                }),
              ],
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
