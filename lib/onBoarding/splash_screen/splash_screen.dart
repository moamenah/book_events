import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_routes.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:book_events/widgets/CustomElevatedButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onBoardingData = [
    {
      "image": AppAssets.Onboarding1,
      "title": "introduction_title_2",
      "subtitle": "introduction_subtitle_2",
    },
    {
      "image": AppAssets.Onboarding2,
      "title": "introduction_title_3",
      "subtitle": "introduction_subtitle_3",
    },
    {
      "image": AppAssets.Onboarding3,
      "title": "introduction_title_4",
      "subtitle": "introduction_subtitle_4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child:  Column(
          children: [
            Image.asset(AppAssets.evently_logo),
            SizedBox(height: height * 0.02),
            Expanded(
              child: PageView.builder(
                itemCount: onBoardingData.length,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                controller: pageController,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.all(16.0),
                    child:  SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(onBoardingData[index]["image"]!,),
                          SizedBox(height: height * 0.02),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              onBoardingData[index]["title"]!.tr(),
                              style: AppStyles.bold20Primary,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            onBoardingData[index]["subtitle"]!.tr(),
                            style: AppStyles.medium16(context),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  );
                },
        ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if(currentIndex!=0)
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryLight,
                        width: 1
                      ),
                    ),
                    child:
                    IconButton(
                        onPressed: (){
                    if(currentIndex>0){
                      pageController.previousPage(duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);

                    };
                    }, icon: Icon(Icons.arrow_back_ios_new,color: AppColors.primaryLight,)
                      ),

                  )
                  else
                   SizedBox(width: 50),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: onBoardingData.length,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        width: 30,
                        height: 10,
                        color: AppColors.primaryLight,
                        rotationAngle: 180,
                        verticalOffset: -10,
                        borderRadius: BorderRadius.circular(24),
                        dotBorder: DotBorder(
                          padding: 2,
                          width: 2,
                          color: AppColors.primaryLight,
                        ),
                      ),
                      dotDecoration: DotDecoration(
                        width: 30,
                        height: 10,
                        color:Theme.of(context).colorScheme.onBackground,
                        dotBorder: DotBorder(
                          padding: 2,
                          width: 2,
                          color:Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryLight, width: 1),

                  ),
                child:
                IconButton(onPressed: (){
                  if(currentIndex<onBoardingData.length-1){
                    pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }
                  else
                    Navigator.pushReplacementNamed(context, AppRoutes.loginRouteName);

                },
                    icon: Icon(
                  currentIndex==onBoardingData.length-1?
                  Icons.check:
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.primaryLight,)),
              )
                ],
              ),
            ),


          ],
        ),

      ),


    );
  }
}
