import 'package:book_events/auth/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreenViewModel extends ChangeNotifier{
  //todo: HOLD DATA .. handle Logic..


  //var emailController=TextEditingController(text: "moamenahmed123@gmail.com");
  //var passwordController=TextEditingController(text: "123456789");


  var formKey=GlobalKey<FormState>();
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController rePasswordController= TextEditingController();
late RegisterNavigator navigator;
  void register()async {
    if(formKey.currentState!.validate()){
      navigator.showMyLoading("Loading...");

      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        navigator.hideMyLoading();
        navigator.showMyMsg("Register Successfully",
          postActionName: "OK",
          posAction: (){
navigator.navigateToHome();
          }
        );
      } on FirebaseAuthException catch (e) {
        navigator.hideMyLoading();

        if (e.code == 'weak-password') {
navigator.showMyMsg("The password provided is too weak.",
postActionName: "Try Again"
);

        } else if (e.code == 'email-already-in-use') {
          navigator.showMyMsg("The account already exists for that email",
              postActionName: "Try Again"

          );
        } else if (e.code == 'network-request-failed') {
          navigator.showMyMsg('Network error. Please check your internet connection.',
              postActionName: "Try Again"

          );
        }else{
          navigator.showMyMsg("Error",postActionName: "Try Again"
          );
        }
      } catch (e) {
        navigator.hideMyLoading();
        navigator.showMyMsg("Error");      }

    }
  }




}