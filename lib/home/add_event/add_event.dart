import 'package:book_events/home/widget/event_tab_items.dart';
import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: Icon(Icons.arrow_back,color: AppColors.primaryLight,),
        title: Text("create_event".tr(),style: AppStyles.medium20primary,),
        centerTitle: true,
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(eventsImageLisT[selectedIndex]),
            ),
            SizedBox(height: height*0.02,),
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
            )
          ],
        ),
      ),
    );
  }
}
