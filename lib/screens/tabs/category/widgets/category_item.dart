import 'package:ecommers_app/utils/size/screen_utils.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key,required this.name,required this.imageUrl, required this.onEdit, required this.onDelete});
  final String name;
  final String imageUrl;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return   Container(
      height: 130,
     margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.black,
        ),
        boxShadow : const [
          BoxShadow(
            spreadRadius: 4,
            blurRadius: 2,
            offset: Offset(10,10),
            color: Colors.grey,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
               child:  Image.network(  "https://img.freepik.com/premium-photo/close-up-table-with-variety-electronics-gadgets-generative-ai_927978-7114.jpg")
              ),
          ),
          Expanded(
            flex: 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                  Center(
                    child: Text(name),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
