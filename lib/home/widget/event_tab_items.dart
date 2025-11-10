import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventTabItems extends StatelessWidget {
  bool isSelected;
  String eventName;
  IconData icon;
  //**
  Color ?selectedBgColor;
  Color? borderColor;
  TextStyle ?selectedTextStyle;
  TextStyle? unSelectedTextStyle;
  Color ?textColor;
Color? iconColor;
  EventTabItems({super.key,required this.eventName,required this.isSelected,
    required this.icon,  this.selectedBgColor,this.borderColor,
     this.selectedTextStyle,this.unSelectedTextStyle,this.textColor,this.iconColor});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var themeProvider=Provider.of<AppThemeProvider>(context);


    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*0.02),
      padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.002),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          color:borderColor??AppColors.primaryLight
          //Theme.of(context).focusColor,
         , width: 2
        ),
        color:isSelected?AppColors.primaryLight:AppColors.transparent
    ),
      child: Row(
        children: [
          Icon(icon,
              color: isSelected?AppColors.whiteColor:
              AppColors.primaryLight,
          ),
          SizedBox(width: width*0.02,),
          Text(eventName,
            style:
            (isSelected?selectedTextStyle??Theme.of(context).textTheme.headlineSmall:
            unSelectedTextStyle??Theme.of(context).textTheme.headlineMedium)
            !.copyWith(color: isSelected?AppColors.whiteColor:AppColors.primaryLight)

          ),
        ]

      ),
    );
  }
}
