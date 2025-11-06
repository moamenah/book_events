import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_navigator.dart';



class LoginScreenViewModel extends ChangeNotifier{
  //todo: hold DATA-- Handle Logic..
  var formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
var passwordController=TextEditingController();

  late LoginNavigator navigator;
  void login()async{
    if (formKey.currentState!.validate()) {

      navigator.showMyLoading("Waiting");

      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        navigator.hideMyLoading();
        navigator.showMyMsg("Login successfully",
        postActionName: "ok",
          posAction: (){
          navigator.navigateToHome();
          }
        );


      } on FirebaseAuthException catch (e) {

        // Hide loading لأي خطأ من Firebase
        navigator.hideMyLoading();

        if (e.code == 'network-request-failed') {
          navigator.showMyMsg('Network error. Please check your internet connection.',
            postActionName: "ok",

          );

        } else if (e.code == 'wrong-password') {
          navigator.showMyMsg('Wrong password provided for that user.',
            postActionName: "ok",

          );

        } else if (e.code == 'user-not-found') {
          navigator.showMyMsg('No user found for that email.',
            postActionName: "ok",

          );
        } else {
          navigator.showMyMsg("Error",postActionName: "ok",
          );
        }

      } catch (e) {
        // Hide loading لأي خطأ عام
        navigator.hideMyLoading();
        navigator.showMyMsg("Error",
          postActionName: "ok",
        );

      }


    }
  }

}