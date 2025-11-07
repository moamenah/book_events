abstract class ForgetPasswordNavigator {
  void showMyLoading(String message);

  void hideMyLoading();

  void showMyMsg(String message, {String?postActionName, Function? posAction});
}