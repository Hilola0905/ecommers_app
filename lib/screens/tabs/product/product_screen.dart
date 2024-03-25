import 'package:ecommers_app/screens/tabs/product/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
           ...List.generate(16, (index) => ProductItem(
             onEdit: () {
               Navigator.pushNamed(context, RouteNames.updatedProductRoute);
             },
             onDelete:  (){
               showDialog(context: context, builder: (context){
                 return  AlertDialog(
                   title : const  Text(" This product is delete "),
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
             }, onTap: () {
               Navigator.pushNamed(context, RouteNames.detailProductRoute);
           },

           )),
        ],
      ),
    );
  }
}
