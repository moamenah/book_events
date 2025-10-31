import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
   var themeProvider =  Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  ClipRRect(
      child: Container(
        margin: EdgeInsets.all(12),
        height: height * 0.32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryLight,width: 2),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppAssets.exhibition_image),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.01),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
                padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.002),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.whiteColor
                ),
                child: Column(
                  children: [
                    Text("21",style: AppStyles.bold20Primary,),
                    Text("Aug",style: AppStyles.bold14Primary,)
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
              padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:themeProvider.isLightMode()?AppColors.whiteColor:AppColors.blueColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hello my sharks",style: AppStyles.bold14Black,),
                  Image.asset(AppAssets.favorite_icon,color:themeProvider.isLightMode()?AppColors.primaryLight:AppColors.whiteColor,)
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
