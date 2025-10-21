import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class themeBottomSheet extends StatelessWidget {
  const themeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider=Provider.of<AppThemeProvider>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: height*0.04,horizontal: width*0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              //todo:change Language to light..
               themeProvider.changeTheme(ThemeMode.light);
               context.setLocale(Locale("light"));

            },
            child:
            themeProvider.isLightMode()?
                getSelectedLanguageItem(textTheme: "light".tr()) :
                getUnSelectedLanguageItem(textTheme: "light".tr())
          ),





          SizedBox(height: height*0.02,),
          InkWell(
              onTap: (){
                //todo:change Language to dark
                themeProvider.changeTheme(ThemeMode.dark);
                context.setLocale(Locale("dark"));

              },
              child: themeProvider.isDarkMode()?
                  getSelectedLanguageItem(textTheme: "dark".tr()):
                  getUnSelectedLanguageItem(textTheme: "dark".tr())
                  
          ),

        ],
      ),
    );
  }
  Widget getSelectedLanguageItem({required String textTheme}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textTheme,
            style:AppStyles.bold20Primary),
        Icon(Icons.check,size: 35,color: AppColors.primaryLight,)
      ],
    );
  }



  Widget getUnSelectedLanguageItem({required String textTheme}){
    return Text(
        textTheme,
        style: AppStyles.bold20Black );
  }
}
