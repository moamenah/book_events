import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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



 Future <void> signInWithGoogle()async{
    navigator.showMyLoading("Signing in with Google");


try{
  final GoogleSignIn googleSignIn = GoogleSignIn();
// 3asahn a5tar ay account tani lw 3awez the same account kol mara ashel code dh
  await googleSignIn.signOut();


  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
if(googleUser==null){
  navigator.hideMyLoading();
  return;
}
  final   GoogleSignInAuthentication googleAuth = await googleUser.authentication;
final AuthCredential credential=GoogleAuthProvider.credential(
  accessToken: googleAuth.accessToken,
  idToken: googleAuth.idToken
);
await FirebaseAuth.instance.signInWithCredential(credential);
  navigator.hideMyLoading();
  navigator.showMyMsg(
    "Logged in with Google successfully!",
    postActionName: "ok",
    posAction: () {
      navigator.navigateToHome();
    },
  );
}catch (e) {
  navigator.hideMyLoading();
  navigator.showMyMsg("Google Sign-In failed: $e");
}

  }
























}