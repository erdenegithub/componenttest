import 'package:componenttest/bloc/button_bloc.dart';
import 'package:componenttest/custom_button.dart';
import 'package:componenttest/custom_textfield.dart';
import 'package:componenttest/login.dart';
import 'package:componenttest/register_username.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: RegisterUsername(),
      home: Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void buttonAction() {
    print('buttonClick');
  }

  void buttonPressed() {
    print('buttonPressed');
  }

  void textFieldChanged(String text) {
    text.length > 4 ? _buttonBloc.enableButton() : _buttonBloc.disableButton();
  }

  ButtonBloc _buttonBloc = ButtonBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<bool>(
                    stream: _buttonBloc.buttonStream,
                    initialData: false,
                    builder: (context, snapshot) {
                      return CustomButton(
                          buttonTitle: 'Button 1',
                          onPressed: buttonAction,
                          enabled: snapshot.data);
                    }),
                TextField(
                  onChanged: (text) => textFieldChanged(text),
                ),
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                CustomButton(
                  buttonTitle: 'Button 2',
                  onPressed: buttonPressed,
                  enabled: true,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _buttonBloc.disableButton,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
