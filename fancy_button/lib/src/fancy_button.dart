
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FancyButton extends StatefulWidget {
  const FancyButton({
    Key? key,
    this.height = 90,
    this.width,
    this.color1,
    this.color2,
    this.textColor,
    this.buttonText = "Submit",
    this.onPress,
    this.textStyle,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Color? color1;
  final Color? color2;
  final Color? textColor;
  final String? buttonText;
  final Function? onPress;
  final TextStyle? textStyle;


  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress!() ?? (){},
      child: Container(
        width: widget.width??MediaQuery.of(context).size.width * 0.90,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
          gradient: LinearGradient(
              colors: [widget.color1??const Color(0xFFCB1841), widget.color2??const Color(0xFF2604DE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '${widget.buttonText}',
            style:  TextStyle(
              color: widget.textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
