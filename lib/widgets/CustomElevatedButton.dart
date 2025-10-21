
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  Color? backGroundColor;
  TextStyle? textStyle;
  Color?borderColor;
  bool icon;// ya3ni 3andy icon wla l2a ?true - false
  Widget? iconWidget;// 3ashan momkn min assets aw min flutter
  MainAxisAlignment?mainAxisAlignment;

  CustomElevatedButton({super.key,
    required this.onPressed,
    required this.text,
    this.backGroundColor=AppColors.primaryLight,
    this.textStyle,
    this.borderColor,
    this.icon=false,
    this.iconWidget,
    this.mainAxisAlignment= MainAxisAlignment.start
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return
      Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                  color: borderColor??AppColors.primaryLight
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: height*0.02,),

          ),
          onPressed: onPressed,
          child: icon?
          Row(
            mainAxisAlignment: mainAxisAlignment!,
            children: [
              iconWidget!,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*0.02),
                child: Text(text
                  ,style: textStyle?? AppStyles.regular20white,),
              ),
            ],
          ):
          Text(text
            ,style: textStyle?? AppStyles.regular20white,),

        ),
      );
  }
}
