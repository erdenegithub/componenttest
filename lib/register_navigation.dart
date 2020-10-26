import 'dart:html';

import 'package:componenttest/register_username.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum RegisterRoute {
  username,
  name,
}

class RegisterNavigation {
  final BuildContext context;
  RegisterNavigation({@required this.context});

  void goto(RegisterRoute route) {
    switch (route) {
      case RegisterRoute.username:
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => RegisterUsername()));
        break;
      case RegisterRoute.name:
        break;
    }
  }
}
