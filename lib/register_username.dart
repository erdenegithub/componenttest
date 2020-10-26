import 'package:componenttest/bloc/button_bloc.dart';
import 'package:componenttest/custom_button.dart';
import 'package:flutter/material.dart';

class RegisterUsername extends StatelessWidget {
  ButtonBloc _buttonBloc = ButtonBloc();

  void textFieldValidation(String text) {
    text.length >= 6 ? _buttonBloc.enableButton() : _buttonBloc.disableButton();
  }

  void buttonAction() {
    print('buttonAction');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      'Та шинэ нэвтрэх нэрээ\nоруулна уу',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Нэвтрэх нэр'),
                      onChanged: (text) => textFieldValidation(text),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Том, жижиг латин үсэг, тоо орсон байх хэрэгтэй\nЖишээ нь: Amarbykhas20',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder<Object>(
              stream: _buttonBloc.buttonStream,
              initialData: false,
              builder: (context, snapshot) {
                return CustomButton(
                    buttonTitle: 'Button 1',
                    onPressed: buttonAction,
                    enabled: snapshot.data);
              }),
        ],
      ),
    );
  }
}
