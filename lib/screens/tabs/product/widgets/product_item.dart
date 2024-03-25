import 'package:ecommers_app/utils/size/screen_utils.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.onEdit, required this.onDelete, required this.onTap});
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onTap;

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
                )
            ),
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                   const  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("name",),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("price",),
                        IconButton(
                            onPressed: onEdit,
                            icon: Icon(Icons.edit)
                        ),
                        IconButton(
                            onPressed: onDelete,
                            icon: Icon(Icons.delete,color: Colors.red,)
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
