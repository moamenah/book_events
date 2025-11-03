import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:book_events/widgets/CustomElevatedButton.dart';
import 'package:book_events/widgets/Custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("forget_password".tr(),
          style: themeProvider.isLightMode()?
          AppStyles.bold16Black:AppStyles.bold14White,
          ),
        backgroundColor:
        themeProvider.isLightMode()?
        Theme.of(context).focusColor:
        Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Image.asset(AppAssets.forget_password),
              SizedBox(height: height*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.02),
                child: CustomTextFormFiled(
                    hintText: "email".tr(),
                          colorBorderSide: AppColors.primaryLight,
                    prefixIcon: Icon(Icons.email,
                      color: themeProvider.isLightMode()?AppColors.blackColor:AppColors.whiteColor,),
                    controller: emailController),
              ),
              SizedBox(height: height*0.002,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
                child: CustomElevatedButton(
                    onPressed: (){},
                    text: "reset_password".tr()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
