import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier{


  //todo:  DATA
// hena eh el data elmafrood tt8ir ? language (en-ar)=> in file main   =>    startLocale: Locale("en"),
// lw we2ft 3leha btakhod many string.


String appLanguage="en";//فيه متغير اسمه:


 // وده بيمثّل اللغة الحالية، صح كده؟
  //  يبقى نقدر نستعمله علشان نعرف إيه اللغة المختارة حاليا



  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) return;
    appLanguage = newLanguage;
   // context.setLocale(Locale(newLanguage)); // ← هنا التبديل الفعلي
    notifyListeners();
  }


}












//todo : FUNCTION=> change Language..
// void changeLanguage(String newLanguage){
//
//   if(appLanguage==newLanguage){
//     //==comparsion-mokarna
//     //lw appLanguage el heya currentLanguage== equal newLanguage . mt3mlsh ay haga
//     return;
//   }
//   appLanguage=newLanguage; //assignment operator..
// //hena lw appLanguage=newLanguage =>  =>  hot el right x left..
// //todo :After change data ..
// notifyListeners();
// //todo: tybe keda changeLanguage x one screen ex : home
// // - profile tab . or . full app .(main).wrap my app .changeNotofireProvide
// }
// // keda msh hyb2a fe ay changes for language ..
// // dh sa7