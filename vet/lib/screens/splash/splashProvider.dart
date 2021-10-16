
import 'package:flutter/material.dart';
import 'package:vet/animations/animations.dart';
import 'package:vet/screens/findDoctor/findDoctor.dart';


class SplashProvider extends ChangeNotifier{
  late BuildContext context;

  init(BuildContext context) async{
    this.context = context;
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(
      seconds: 4,
    ));
    Navigator.push(context, Transitions(page: FindDoctor()));
  }
}