import 'package:book_events/login/Forget_password_navigator.dart';
import 'package:book_events/login/forget_password_view_model.dart';
import 'package:book_events/providers/app_theme_provider.dart';
import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:book_events/utils/dialog_utils.dart';
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

class _ForgetPasswordState extends State<ForgetPassword>implements ForgetPasswordNavigator {
  ForgetPasswordViewModel viewModel =ForgetPasswordViewModel();
@override
  void initState() {
    super.initState();
    viewModel.navigator=this;
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
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
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  Image.asset(AppAssets.forget_password),
                  SizedBox(height: height*0.02,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.02),
                    child: CustomTextFormFiled(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your email";
                          }
                          bool emailValid = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
                          ).hasMatch(value);
                          if (!emailValid) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },

                        hintText: "email".tr(),
                              colorBorderSide: AppColors.primaryLight,
                        prefixIcon: Icon(Icons.email,
                          color: themeProvider.isLightMode()?AppColors.blackColor:AppColors.whiteColor,),
                        controller: viewModel.emailController),
                  ),
                  SizedBox(height: height*0.002,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
                    child: CustomElevatedButton(
                        onPressed: (){
                          viewModel.ResetPassword();
                        },
                        text: "reset_password".tr()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void hideMyLoading() {
    // TODO: implement hideMyLoading
    DialogUtils.hideLoading(context: context);
  }

  @override
  void showMyLoading(String message) {
    // TODO: implement showMyLoading
    DialogUtils.showLoading(context: context, text: message);
  }

  @override
  void showMyMsg(String message, {String? postActionName, Function? posAction}) {
    // TODO: implement showMyMsg
    DialogUtils.showMsg(context: context, text: message,
    posAction: posAction,
      postActionName: postActionName
    );
  }
}
