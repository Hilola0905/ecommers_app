import 'package:ecommers_app/data/models/product_model.dart';
import 'package:ecommers_app/utils/size/screen_utils.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.onEdit, required this.onDelete, required this.onTap, required this.product});
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 4,
              blurRadius: 0,
              offset: Offset(8,8),
              color: Colors.grey
            )
          ],
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
                child: ClipRRect(
                  child: Image.network( product.imageUrl),
                )
            ),
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("name : ${product.productName}",),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.price.toString(),),
                        IconButton(
                            onPressed: onEdit,
                            icon: const Icon(Icons.edit)
                        ),
                        IconButton(
                            onPressed: onDelete,
                            icon:  const Icon(Icons.delete,color: Colors.red,)
                        ),
                      ],
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
