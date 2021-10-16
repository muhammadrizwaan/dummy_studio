import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet/res/sizes.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSizes().height,
          width: AppSizes().width,
          child: Center(
            child: Text("Appointments"),
          ),
        ),
      ),
    );
  }
}
