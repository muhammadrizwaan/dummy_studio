

import 'package:flutter/material.dart';
import 'package:vet/res/sizes.dart';
import 'package:vet/res/utils.dart';


AppSizes sizes = AppSizes();
Future<void> initializeAppResources({@required context}) async{
  sizes.initializeSize(context);
  PreferenceUtils.init();
}

double getHeight() => sizes.height ?? 2560;
double getWidth() => sizes.width ?? 1440;

double commonWidth=getWidth()*.9;

