import 'package:book_events/ui/home/tabs/LanguageBottomSheet/LanguageBottomSheet.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({super.key});

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.04,
          horizontal: width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("language".tr(), style: Theme
          .of(context)
          .textTheme
          .headlineLarge,),
            InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: Container(
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
              "Arabic",
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
            ]
            ,
            ),
      )
    ,
    );
  }
  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
     builder: (context) => Languagebottomsheet(),
    );
  }
}


