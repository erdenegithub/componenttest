import 'package:componenttest/custom_button.dart';
import 'package:componenttest/custom_round_button.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  void registerButtonClicked() {
    print('RegisterButtonClicked');
  }

  void loginButtonClicked() {
    print('loginButtonClicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: CustomRoundButton(
                    buttonTitle: 'Нэвтрэх',
                    onPressed: loginButtonClicked,
                    colorful: true),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 25),
                child: CustomRoundButton(
                    buttonTitle: 'Бүртгүүлэх',
                    onPressed: registerButtonClicked,
                    colorful: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
