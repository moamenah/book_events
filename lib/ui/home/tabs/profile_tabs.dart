import 'package:book_events/providers/app_language_providder.dart';
import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/ui/home/tabs/LanguageBottomSheet/LanguageBottomSheet.dart';
import 'package:book_events/ui/home/tabs/Theme/themeBottomSheet.dart';
import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:book_events/widgets/CustomElevatedButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({super.key});

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        toolbarHeight: height*0.22,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          ),
        ),
        title: Row(
          children: [
            Image.asset(AppAssets.route_image,width: 100,height: 100,),
            SizedBox(width: width*0.04,),
            Column(
              children: [
                Text("Route Academy", style: AppStyles.bold24White,),
                Text("moamenahmed@gmail.com",
                    style: AppStyles.medium16White)
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.04,
          horizontal: width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("language".tr(),
              style: Theme.of(context).textTheme.headlineLarge,),
            InkWell(
              onTap: (){
                showLanguageBottomSheet();
                },
              child:
              Container(
              padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.01,
              ),
              margin: EdgeInsets.symmetric(vertical: height * 0.02),
              decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(16),
              border: Border.all(width: 2, color: AppColors.primaryLight),
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
              languageProvider.appLanguage=="en"?"english".tr():
              "arabic".tr(),
              style: AppStyles.bold20Primary,
              ),
              Icon(
              Icons.arrow_drop_down_outlined,
              size: 35,
              color: AppColors.primaryLight,
              ),
              ],
              ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Text("theme".tr(),
              style: Theme.of(context).textTheme.headlineLarge,),
            InkWell(
              onTap: (){
                showThemeBottomSheet();
              },
              child:
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.01,
                ),
                margin: EdgeInsets.symmetric(vertical: height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  border: Border.all(width: 2, color: AppColors.primaryLight),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.isDarkMode()?
                      "dark".tr():
                      "light".tr(),
                      style: AppStyles.bold20Primary,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 35,
                      color: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomElevatedButton(onPressed: (){},
                text: "logout".tr(),
              backGroundColor: AppColors.redColor,
              borderColor: AppColors.redColor,
              icon: true,
              iconWidget:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*0.04),
                child: Icon(Icons.logout,size: 35,color: AppColors.whiteColor,),
              ),
            )

          ],
            ),
      ),





    );
  }
  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
     builder: (context) => Languagebottomsheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => themeBottomSheet(),
    );
  }


}


