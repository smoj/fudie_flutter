import 'package:flutter/material.dart';

class UIButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;

  UIButton(this.buttonText, {this.buttonColor, this.buttonTextColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).size.width * 0.053,
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).size.width * 0.035
      ),
      decoration: BoxDecoration(
        color: this.buttonColor,
        borderRadius: BorderRadius.circular(50)
      ),
      child: Text(this.buttonText, textAlign: TextAlign.center, style: Theme.of(context).textTheme.body1.copyWith(
        color: this.buttonTextColor,
        fontFamily: 'Baloo',
        fontSize: MediaQuery.of(context).size.width * 0.055
      ),),
    );
  }
}
