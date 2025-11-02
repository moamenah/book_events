import 'package:book_events/utils/app_assets.dart';
import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_routes.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:book_events/widgets/CustomElevatedButton.dart';
import 'package:book_events/widgets/Custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController rePasswordController= TextEditingController();
  bool obscurePassword= true;
  bool obscureRePassword = true;
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("register".tr(),style: AppStyles.bold16Black),
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
      ),
      body:  Form(
key: formKey,
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Image.asset(AppAssets.evently_logo2,width: 136,height: 186,),
                SizedBox(height: height*0.02,),
                CustomTextFormFiled(
            prefixIcon: Icon(Icons.person),
                    hintText: "name".tr(),
                    validator: (value){
                      if(value==null || value.trim().isEmpty){
                        return "please_enter_some_text".tr();
                      }

                      return null;
                    },
                    controller: nameController),
                SizedBox(height: height*0.02,),
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
                SizedBox(height: height*0.02,),
                CustomTextFormFiled(
                    obscureText: obscureRePassword,
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
                        obscureRePassword=!obscureRePassword;
                      });
                    },
                        icon: Icon(obscureRePassword?Icons.visibility_off
                            :Icons.visibility)),

                    hintText: "re_password".tr(),
                    keyBoardType: TextInputType.text,
                    controller: rePasswordController),
                SizedBox(height: height*0.02,),
            CustomElevatedButton(onPressed: (){
              register();
            }, text: "create_account".tr()),
                SizedBox(height: height*0.02,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already_have_account ?".tr(),style: AppStyles.medium16black,),
                    GestureDetector(
                      onTap: (){

                        Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
                      },
                      child: Text("login".tr(),style: AppStyles.bold16Primary.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryLight
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
if(formKey.currentState!.validate()){
  if(passwordController.text!=rePasswordController.text){
    ScaffoldMessenger.of(context).showSnackBar
      (SnackBar(content: Text("re_password_does_not_match_password".tr(),
      style: AppStyles.medium16black,
    ),
      backgroundColor: AppColors.redColor,
    ),
    );
    return;

  }
}
  }
}
