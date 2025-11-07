import 'package:book_events/login/Forget_password_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  //todo: hold DATA.. handle logic..
  TextEditingController emailController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  late ForgetPasswordNavigator navigator;



void ResetPassword ()async{
if(formKey.currentState!.validate()){
  navigator.showMyLoading("Sending reset link...");
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    navigator.hideMyLoading();
    navigator.showMyMsg("Password reset email sent!",postActionName: "ok",posAction: (){}
    );
  }  on FirebaseAuthException catch(e){
    navigator.hideMyLoading();
    navigator.showMyMsg(e.message??"Something went wrong!");
  }catch(e){
    navigator.hideMyLoading();
    navigator.showMyMsg("Error sending email");
  }
}



}





}