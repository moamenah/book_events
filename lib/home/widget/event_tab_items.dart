import 'package:book_events/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EventTabItems extends StatelessWidget {
  bool isSelected;
  String eventName;
  IconData icon;
  EventTabItems({super.key,required this.eventName,required this.isSelected, required this.icon});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*0.02),
      padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.002),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          color: Theme.of(context).focusColor,
          width: 2
        ),
        color: isSelected?Theme.of(context).focusColor:AppColors.transparent,
    ),
      child: Row(
        children: [
          Icon(icon,
              color:
          isSelected?Theme.of(context).textTheme.headlineMedium!.color
              :Theme.of(context).textTheme.headlineSmall!.color
          ),
          SizedBox(width: width*0.02,),
          Text(eventName,style: isSelected?
          Theme.of(context).textTheme.headlineMedium:
          Theme.of(context).textTheme.headlineSmall,)
        ],
      ),
    );
  }
}
