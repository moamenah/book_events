import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_routes.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:book_events/widgets/CustomElevatedButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int languageIndex=0;
  int themeIndex=0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: width*0.02),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(AppAssets.evently_logo)),
              Image.asset(AppAssets.intrduction_image,
                fit: BoxFit.cover,
                ),
              Text("introduction_title_1".tr(),style: AppStyles.bold20Primary,),
              SizedBox(height: height*0.02,),
              Text("introduction_subtitle_1".tr(),
                style: AppStyles.medium16(context),

              ),
              SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Text("language".tr(),style: AppStyles.medium20primary,),
              AnimatedToggleSwitch<int>.rolling(
            current: languageIndex,
            values: [0, 1],
            iconOpacity: 2,
            onChanged: (i) {
              setState(() {languageIndex=i;
              if(i==1){
                context.setLocale(Locale("en"));
              }else{
                context.setLocale(Locale("ar"));
              }

              },
              );
            },
          iconList: [
            Image.asset(AppAssets.EG),
            Image.asset(AppAssets.LR),
          ],
          borderWidth: 5,
          style: ToggleStyle(
            borderColor: AppColors.primaryLight,
            indicatorColor: AppColors.primaryLight,
            backgroundColor: Theme.of(context).colorScheme.background
          ),
              ),

            ],
          ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text("theme".tr(),style: AppStyles.medium20primary,),
                  AnimatedToggleSwitch<int>.rolling(
                    current: themeIndex,
                    values: [0, 1],
                    iconOpacity: 2,


                    onChanged: (value) {
                      setState(() {
                        themeIndex=value;
                        themeProvider.changeTheme(value==1?ThemeMode.dark:ThemeMode.light);
                      },
                      );
                    },


                    iconList: [
                      Icon(Icons.sunny),
                      Icon(Icons.motion_photos_on_sharp),
                      // Image.asset(AppAssets.sun),
                      // Image.asset(AppAssets.Moon),
                    ],
                    borderWidth: 5,
                    style: ToggleStyle(
                      borderColor: AppColors.primaryLight,
                      indicatorColor: AppColors.primaryLight,
                        backgroundColor: Theme.of(context).colorScheme.background

                      //  indicatorBorder: BoxBorder.all(width: 2)
                    ),
                  ),

                ],
              ),
              SizedBox(height: height * 0.02),
          CustomElevatedButton(
              onPressed: (){
Navigator.pushNamed(context, AppRoutes.SplashScreen);
              }, text: "intro_btn".tr())

            ],
          ),
        ),
      ),
    );
  }
}
