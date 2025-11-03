import 'package:book_events/home/widget/event_item.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:book_events/widgets/Custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController searchController =TextEditingController();
    return Scaffold(
body: SafeArea(
  child: Padding(
    padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
    child: Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.02),
          child: CustomTextFormFiled(
            colorBorderSide: AppColors.primaryLight,
            hintStyle: AppStyles.bold14Primary,
            prefixIcon: Icon(Icons.search,color: AppColors.primaryLight,),
            hintText: "Search_for_Event".tr(),
              controller: searchController),
        ),
        SizedBox(height: height*0.02,),
        Expanded(child: ListView.separated(
            itemBuilder:(context, index) => EventItem(),
            separatorBuilder: (context, index) => SizedBox(height: height*0.001,),
            itemCount: 20)),
      ],
    ),
  ),
),
    );
  }
}
