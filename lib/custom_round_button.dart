import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;
  final bool colorful;

  CustomRoundButton({
    @required this.buttonTitle,
    @required this.onPressed,
    @required this.colorful,
  });

  final Gradient buttonGradient = LinearGradient(
    colors: [
      Colors.red[600].withOpacity(1),
      Colors.orange[500].withOpacity(1),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  final Gradient disabledGradient = LinearGradient(
    colors: [
      Colors.grey[100],
      Colors.grey[100],
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child: MaterialButton(
        padding: EdgeInsets.only(left: 0, right: 0),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
              gradient: colorful ? buttonGradient : disabledGradient),
          child: Container(
            padding: EdgeInsets.only(top: 16),
            constraints: BoxConstraints(minHeight: 50),
            alignment: Alignment.topCenter,
            child: Text(
              buttonTitle,
              style: TextStyle(
                  color: colorful ? Colors.white : Colors.grey, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
