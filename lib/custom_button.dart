import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;
  final bool enabled;

  CustomButton({
    @required this.buttonTitle,
    @required this.onPressed,
    @required this.enabled,
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
    return MaterialButton(
      padding: EdgeInsets.only(left: 0, right: 0),
      onPressed: enabled ? onPressed : null,
      child: Ink(
        decoration: BoxDecoration(
            gradient: enabled ? buttonGradient : disabledGradient),
        child: Container(
          padding: EdgeInsets.only(top: 16),
          constraints: BoxConstraints(
              minHeight: 50 + MediaQuery.of(context).padding.bottom),
          alignment: Alignment.topCenter,
          child: Text(
            buttonTitle,
            style: TextStyle(
                color: enabled ? Colors.white : Colors.grey, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
