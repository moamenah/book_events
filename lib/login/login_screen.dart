import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_routes.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:book_events/widgets/CustomElevatedButton.dart';
import 'package:book_events/widgets/Custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  var formKey=GlobalKey<FormState>();
  bool obscurePassword= true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child:  Form(
            key: formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.evently_logo2),
                  CustomTextFormFiled(
                   // colorBorderSide: AppColors.greyColor,
                    validator: (value){
                      if(value==null || value.trim().isEmpty){
                        return "please_enter_some_text".tr();
                      }
                      bool emailValid = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
                      ).hasMatch(value);
                      if(!emailValid){
                        return"please_enter_valid_email".tr();
                      }
                      return null;
                    },
                    prefixIcon: Icon(Icons.email),
                      hintText: "email".tr(),
                      keyBoardType: TextInputType.text,
                      controller: emailController),
                  SizedBox(height: height*0.02,),
                  CustomTextFormFiled(
                    obscureText: obscurePassword,
                    obscuringCharacter: "*",
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return "please_enter_your_password".tr();
                      }
                      if(value.length<6){
                        return"password_must_be_at_least_6_characters".tr();
                      }
                      return null;
                    },
                    prefixIcon: Icon(Icons.lock,),


                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          obscurePassword=!obscurePassword;
                        });
                      },
                          icon: Icon(obscurePassword?Icons.visibility_off:Icons.visibility)),

                      hintText: "password".tr(),
                      keyBoardType: TextInputType.text,
                      controller: passwordController),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: (){}, child:
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(AppRoutes.forgetPassword);
                  },
                  child: Text("forget_Password?".tr(),
                    style: AppStyles.bold16Primary.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryLight),
                  ),
                ),
                ),
              ),
                  CustomElevatedButton(onPressed: (){
                    //Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
                     Login();
                  },
                      text: "login".tr(),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("don’t_Have_Account ?".tr(),
                        style: AppStyles.medium16black,),
                      SizedBox(
                        width: width*0.02,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed(AppRoutes.registerRouteName);
                        },
                        child: Text("create_Account".tr(),
                          style: AppStyles.bold16Primary.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryLight
                        ),
                        ),
                      ),
                    ],
                  ), SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.primaryLight,
                          thickness: 2,
                          indent: width*0.10,
                          endIndent: width*0.04,
                        ),
                      ),
                      Text("or".tr(),style: AppStyles.medium16primary,),
                      Expanded(
                        child: Divider(
                          color: AppColors.primaryLight,
                          thickness: 2,
                          indent: width*0.04,
                          endIndent: width*0.10,
                        ),
                      ),


                    ],
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  CustomElevatedButton(
                    mainAxisAlignment: MainAxisAlignment.center,
                    icon: true,
                    iconWidget: Image.asset(
                        AppAssets.icon_google),
                    backGroundColor: AppColors.transparent,
                      textStyle: AppStyles.medium20primary,
                      onPressed: (){},
                      text: "login_with_google".tr(),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Login() {
    if(formKey.currentState!.validate()){}
  }
}
