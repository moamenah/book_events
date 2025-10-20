import 'package:book_events/providers/app_language_providder.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Languagebottomsheet extends StatelessWidget {
  const Languagebottomsheet({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider=Provider.of<AppLanguageProvider>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: height*0.04,horizontal: width*0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              //todo:change Language to english..

              languageProvider.changeLanguage("en");
               context.setLocale(Locale("en"));

            },
            child: languageProvider.appLanguage=="en"?
                getSelectedLanguageItem(textLanguage: "english".tr()) :
                getUnSelectedLanguageItem(textLanguage: "english".tr())
          ),





          SizedBox(height: height*0.02,),
          InkWell(
              onTap: (){
                //todo:change Language to arabic
                languageProvider.changeLanguage("ar");
                 context.setLocale(Locale("ar"));

              },
              child: languageProvider.appLanguage=="ar"?
                  getSelectedLanguageItem(textLanguage: "arabic".tr()):
                  getUnSelectedLanguageItem(textLanguage: "arabic".tr())
                  
          ),

        ],
      ),
    );
  }
  Widget getSelectedLanguageItem({required String textLanguage}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textLanguage,
            style:AppStyles.bold20Primary),
        Icon(Icons.check,size: 35,color: AppColors.primaryLight,)
      ],
    );
  }



  Widget getUnSelectedLanguageItem({required String textLanguage}){
    return Text(
        textLanguage,
        style: AppStyles.bold20Black );
  }
}
