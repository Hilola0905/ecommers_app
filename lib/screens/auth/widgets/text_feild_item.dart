import 'package:ecommers_app/utils/size/screen_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/style/app_text_style.dart';


class TextFieldItem extends StatefulWidget {
  const TextFieldItem(
      {super.key,
        required this.exp,
        required this.hintText,
        required this.controller,
        required this.isPassword,
        required this.errorText,

      });

  final RegExp exp;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String errorText;


  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  var eye = CupertinoIcons.eye;
  bool obscureText = false;

  @override
  void initState() {
    if (widget.isPassword) {
      obscureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.4,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? obscureText : false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String? value) {
          if (value != null && widget.exp.hasMatch(value)) {
            return null;
          } else {
            return widget.errorText;
          }
        },
        style: AppTextStyle.interRegular.copyWith(fontSize: 22.w),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 13),
          fillColor: AppColors.white,
          border: InputBorder.none,
          filled: true,
          hintText: "  ${widget.hintText}",

          hintStyle: AppTextStyle.interRegular.copyWith(
              fontSize: 18.w,
              fontWeight: FontWeight.w400
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.w),
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.w),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.w),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.w),
            borderSide: const BorderSide(color: Colors.red),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
            onPressed: () {
              if (obscureText) {
                obscureText = false;
                eye = CupertinoIcons.eye_slash;
              } else {
                obscureText = true;
                eye = CupertinoIcons.eye;
              }
              setState(() {});
            },
            icon: Icon(eye),
          )
              : null,
        ),
      ),
    );
  }
}
