
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vet/res/assets.dart';
import 'package:vet/res/res.dart';

class Loader {
    showLoader({
    BuildContext ? context,
  }) {
    showDialog(
      context: context!,
      builder: (_) {
        return Material(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Container(
                width: getWidth() * 0.25,
                height: getHeight() * 0.25,
                child: Lottie.asset(
                  Assets.loader_spinner,
                ),
            ),
          ),
        );
      },
    );
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
    static double getHeight() => sizes.height ?? 2560;
    static double getWidth() => sizes.width ?? 1440;

}
