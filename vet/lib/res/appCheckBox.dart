
import 'package:flutter/material.dart';
import 'package:vet/res/res.dart';

import 'colors.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AppCheckbox({
    required Key key,
    this.value = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        disabledColor: Colors.transparent,
        unselectedWidgetColor: Colors.transparent,
      ),
      child: SizedBox(
        width: getWidth()*.05,
        height: getHeight()*.026,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color:Colors.green ,width: 1),
          ),
        //  clipBehavior: Clip.hardEdge,
          child: Transform.scale(
            scale:getHeight()*.0014,
            child: Checkbox(
           //   materialTapTargetSize:10,
              activeColor: Colors.transparent,
              checkColor: AppColors.mainColor,
              value: value,
              onChanged: (value) {
                onChanged(value!);
              },
            ),
          ),
        ),
      ),
    );
  }
}