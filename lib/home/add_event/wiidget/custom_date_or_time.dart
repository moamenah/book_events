import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDateOrTime extends StatelessWidget {
  String iconDateOrTime; // hena string 3ashan icon 3andy assets
  String textDateOrTime;
  String chooseDateOrTime;
  Color iconColor;
  VoidCallback chooseDateOrTimeClick;



   CustomDateOrTime({super.key,required this.iconColor,required this.chooseDateOrTimeClick,
     required this.chooseDateOrTime,required this.iconDateOrTime,required this.textDateOrTime});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Row(
      children: [
        Image.asset(iconDateOrTime,
          color:themeProvider.isDarkMode()?AppColors.whiteColor:AppColors.blackColor,),
        SizedBox(width: width*0.03,),
        Text(textDateOrTime,
          style:themeProvider.isDarkMode()?
          AppStyles.medium16White:AppStyles.medium16black,),
        Spacer(),
        TextButton(onPressed: chooseDateOrTimeClick,
            child: Text(
          chooseDateOrTime,
          style: AppStyles.medium16primary,)),
      ],
    );

  }
}
