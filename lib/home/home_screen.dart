import 'package:book_events/home/Favorite_tab.dart';
import 'package:book_events/home/Map_tab.dart';
import 'package:book_events/home/home_tab.dart';
import 'package:book_events/ui/home/tabs/profile_tabs.dart';
import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedTab=0;
  List<Widget>tabs=[
    HomeTab(),
    MapTab(),
    FavoriteTab(),
    ProfileTabs(),
  ];



  @override
  Widget build(BuildContext context) {
    var width  = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedTab,
          onTap: (index){
            setState(() {
              selectedTab=index;

            });
          },
            items:[
        buildBottomNavigationBar(label: "home".tr(),
          selectedIconName: AppAssets.icon_home,
          unselectedIconName: AppAssets.home_sel
          , index: 0),
            buildBottomNavigationBar(
            label: "map".tr(),
            selectedIconName: AppAssets.mao_sel,
            unselectedIconName:AppAssets.icon_map,
            index: 1),
            buildBottomNavigationBar(
            label: "favorite".tr(),
            selectedIconName: AppAssets.fav_sel,
            unselectedIconName: AppAssets.favorite_icon,
            index: 2),
            buildBottomNavigationBar(
            label: "profile".tr(),
            selectedIconName: AppAssets.profile_sele,
            unselectedIconName: AppAssets.profile_icon,
            index: 3)
        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        child: Icon(Icons.add,size: 35,color: AppColors.whiteColor,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedTab],
    );
  }

   BottomNavigationBarItem buildBottomNavigationBar(
  {required String label,
    required String selectedIconName,
    required String unselectedIconName,
    required int index}
       ){
    return BottomNavigationBarItem(icon:
    ImageIcon(AssetImage(
        selectedTab==index?
        selectedIconName:unselectedIconName)),label: label);
   }
}
