import 'package:rxdart/subjects.dart';

class ButtonBloc {
  bool buttonState = false;
  final _controller = BehaviorSubject<bool>();
  Stream<bool> get buttonStream => _controller.stream;

  void enableButton() {
    buttonState = true;
    _controller.add(true);
  }

  void disableButton() {
    buttonState = false;
    _controller.add(false);
  }

  bool getState() {
    print(buttonState);
    return buttonState;
  }

  dispose() {
    _controller.close();
  }
}
