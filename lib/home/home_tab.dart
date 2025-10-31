import 'package:book_events/home/widget/event_item.dart';
import 'package:book_events/home/widget/event_tab_items.dart';
import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> eventsNameList = [
    "all",
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


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

     appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title:    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.02,),
            Text("welcome_back".tr(),style: AppStyles.regular14white,),
            Text("Moamen Ahmed",style: AppStyles.bold24White,),
          ],
        ),
        actions: [
          Row(
            children: [
              ImageIcon(AssetImage(AppAssets.icon_theme),
                color: AppColors.whiteColor,),
              SizedBox(width: width*0.02,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: width*0.02),
                  padding:EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.whiteColor
                  ),
                  child: Text("En",style: AppStyles.bold14Primary,),
                ),
              ),
            ],
          ),
        ],
        bottom: AppBar(
          toolbarHeight: height*0.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          title: Column(
            children: [
              Row(
                children: [
                  ImageIcon(AssetImage(AppAssets.icon_map),color: AppColors.whiteColor,),
                  SizedBox(width: width*0.02,),
                  Text("Cairo,Egypt",style: AppStyles.medium16White,)
                ],
              ),
              SizedBox(height: height * 0.01),
DefaultTabController(
    length:eventsNameList.length ,
    child: TabBar(
      isScrollable: true,
        tabAlignment: TabAlignment.start,
       labelPadding:EdgeInsets.zero,
        dividerColor: AppColors.transparent,
        indicatorColor: AppColors.transparent,
        onTap: (index){
        setState(() {
          selectedIndex=index;
        });
        },
        tabs:
    eventsNameList.map((eventName) {
      int index=eventsNameList.indexOf(eventName);
      return EventTabItems(
          eventName:eventName.tr() ,
          isSelected: selectedIndex==eventsNameList.indexOf(eventName),
          icon:eventsIconsList[index]
      );
    },
    ).toList(),
    ),
)
            ],
          ),
        ),
      ),
body:  Padding(
  padding:  EdgeInsets.only(top: 5),
  child: Column(
    children: [
      Expanded(child: ListView.separated(
          itemBuilder:(context, index) => EventItem(),
          separatorBuilder: (context, index) => SizedBox(height: height*0.001,),
          itemCount: 20)),
    ],
  ),
),
    );
  }
}

































