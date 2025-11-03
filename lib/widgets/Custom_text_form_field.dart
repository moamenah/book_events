import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef OnValidator=String? Function(String?)?;
// leh nullable ? 3ashan momkn user Maybe doesn't write anything

class CustomTextFormFiled extends StatelessWidget {
  Color colorBorderSide; // => variable
  String ? hintText; // hint nullable ? leh ? 3ashan momkn ab3to w momkn l2a...
  TextStyle? hintStyle;
  String ?labelText;
  TextStyle? labelStyle;
  Widget?prefixIcon;// 3ashan 3ady ab3y icons aw assets
  Widget?suffixIcon;
  OnValidator validator;
  TextEditingController controller;
  TextInputType keyBoardType;
  bool obscureText;
  String? obscuringCharacter;
  int?maxLines;
  // constructor
  CustomTextFormFiled({super.key,
    this.colorBorderSide= AppColors.greyColor,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    required this.controller,
    this.keyBoardType=TextInputType.text,
    this.obscureText=false,
    this.obscuringCharacter,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider= Provider.of<AppThemeProvider>(context);


    return TextFormField(
      maxLines: maxLines??1,
      keyboardType: keyBoardType,
      style: themeProvider.isLightMode()?AppStyles.medium16black:AppStyles.medium16White,
      decoration: InputDecoration(
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: colorBorderSide,
                width: 1,
              )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: AppColors.redColor,
                width: 1.5
            ),
          ),
          errorStyle: AppStyles.medium16primary.copyWith(
              color: AppColors.redColor
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.primaryLight,
                width: 1.5,
              )
          ),
          focusedErrorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.redColor,
                width: 1,
              )
          ),




          hintText:hintText,
          hintStyle:themeProvider.isLightMode()?hintStyle??AppStyles.medium16black:AppStyles.medium16White,//lw ana mb3tsh default bta3o grey
          labelText: labelText,
          labelStyle:labelStyle??AppStyles.medium16Grey,
          prefixIcon: prefixIcon,
          suffixIcon:suffixIcon
      ),
      validator: validator,
      controller: controller,
      obscureText:obscureText ,
      obscuringCharacter:obscuringCharacter??"." ,
    );
  }
}
