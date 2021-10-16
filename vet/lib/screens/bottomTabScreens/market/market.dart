import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet/res/sizes.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSizes().height,
          width: AppSizes().width,
          child: Center(
            child: Text("Market"),
          ),
        ),
      ),
    );
  }
}
