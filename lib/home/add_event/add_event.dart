import 'package:book_events/home/add_event/wiidget/custom_date_or_time.dart';
import 'package:book_events/home/widget/event_tab_items.dart';
import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:book_events/widgets/CustomElevatedButton.dart';
import 'package:book_events/widgets/Custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
 final List<String> eventsNameList = [
    "sport",
    "birthday",
    "meeting",
    "gaming",
    "workshop",
    "book_club",
    "exhibition",
    "holiday",
    "eating",
  ];
  int selectedIndex=0;

  final List<IconData>eventsIconsList=[
    Icons.all_inbox_rounded,
    Icons.sports,
    Icons.celebration,
    Icons.meeting_room,
    Icons.games,
    Icons.workspace_premium,
    Icons.airplane_ticket,
    Icons.show_chart,
    Icons.holiday_village,
    Icons.food_bank_sharp,
  ];
  List<String> eventsImageLisT = [
    AppAssets.sport_image,
    AppAssets.birthday,
    AppAssets.meeting_image,
    AppAssets.gaming_image,
    AppAssets.workshop_image,
    AppAssets.bookClub_image,
    AppAssets.exhibition_image,
    AppAssets.holiday_image,
    AppAssets.eating_image,
  ];
TextEditingController titleController =TextEditingController();
TextEditingController descriptionController =TextEditingController();
 final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
  var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: Icon(Icons.arrow_back,color: AppColors.primaryLight,),
        title: Text("create_event".tr(),style: AppStyles.medium20primary,),
        centerTitle: true,
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
        child:  SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(eventsImageLisT[selectedIndex]),
                ),
                SizedBox(height: height*0.01,),
                SizedBox(
                  height: height*0.05,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex=index;
                            });
                          },
                          child: EventTabItems(
                              eventName: eventsNameList[index].tr(),
                              isSelected: selectedIndex==index,
                              icon: eventsIconsList[index]),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: height*0.01,),
                      itemCount: eventsNameList.length),
                ),
                SizedBox(height: height*0.01,),
                Text("title".tr(),
                  style:themeProvider.isDarkMode()?AppStyles.medium16White:AppStyles.medium16Grey),
                SizedBox(height: height*0.01,),
                CustomTextFormFiled(
                    prefixIcon: Image.asset(AppAssets.icon_edit,color: themeProvider.isDarkMode()?
                    AppColors.whiteColor:AppColors.greyColor,),
                    hintText: "event_title".tr(),
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return "please_enter_event_title".tr();
                      }
                      return null;
                    },
                    hintStyle:themeProvider.isDarkMode()?
                    AppStyles.medium16White:AppStyles.medium16Grey,
                    colorBorderSide: themeProvider.isDarkMode()?
                    AppColors.primaryLight:AppColors.greyColor,
                    controller: titleController),
                SizedBox(height: height*0.02,),
                Text("description".tr(),
                    style:themeProvider.isDarkMode()?AppStyles.medium16White:AppStyles.medium16Grey),
                SizedBox(height: height*0.01,),
                CustomTextFormFiled(
                    hintText: "event_description".tr(),
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return "please_enter_event_description".tr();
                      }
                      return null;
                    },
                    hintStyle:themeProvider.isDarkMode()?
                    AppStyles.medium16White:AppStyles.medium16Grey,
                    maxLines: 4,
                    colorBorderSide: themeProvider.isDarkMode()?
                    AppColors.primaryLight:AppColors.greyColor,
                    controller: descriptionController),
                SizedBox(height: height*0.01,),
                CustomDateOrTime(
                    iconColor: Theme.of(context).dividerColor,
                    chooseDateOrTimeClick: (){
                      chooseDate();
                    },
                    chooseDateOrTime: "moamrn",
                    iconDateOrTime: AppAssets.event_date_icon,
                    textDateOrTime: "event_date".tr()),
                SizedBox(height: height*0.001,),
                CustomDateOrTime(
                    iconColor: Theme.of(context).dividerColor,
                    chooseDateOrTimeClick: (){
                      chooseTime();
                    },
                    chooseDateOrTime: "moamrn",
                    iconDateOrTime: AppAssets.icon_time,
                    textDateOrTime: "choose_date".tr()),
                SizedBox(height: height*0.01,),
                Text("location".tr(),style:themeProvider.isDarkMode()?AppStyles.medium16White:AppStyles.medium16black,),
                SizedBox(height: height*0.01,),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.015),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primaryLight,
                      width: 2
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: width * 0.02),
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.02,
                            horizontal: width * 0.04),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.primaryLight,
                            width: 1
                          ),
                        ),
                        child: Image.asset(AppAssets.icon_location,
                          color:themeProvider.isDarkMode()?
                          AppColors.whiteColor:AppColors.primaryLight,),
                      ),
                      SizedBox(width: width*0.01,),
                      Text("choose_event_location".tr(),
            style: AppStyles.medium16primary,
                    ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined,color: AppColors.primaryLight,)
                  ],
                  ),
                ),
                SizedBox(height: height*0.02,),
                CustomElevatedButton(onPressed: (){
                  addEvent();

                }, text: "add_event".tr())
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseDate() {}

  void chooseTime() {}

  void addEvent() {}
}
