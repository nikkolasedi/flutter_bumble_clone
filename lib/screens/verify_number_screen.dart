import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyNumberScreen extends StatefulWidget {
  final String mobileNumber;

  VerifyNumberScreen({this.mobileNumber});

  @override
  _VerifyNumberScreenState createState() => _VerifyNumberScreenState();
}

class _VerifyNumberScreenState extends State<VerifyNumberScreen> {
  var _currentText = '';
  Timer _timer;
  int _remainingSeconds = 30;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startCountdownTimer();
  }

  _startCountdownTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds -= 1;
        });
      } else {
        timer.cancel();
      }
    });
  }

  _resetThenStartTimer() {
    _remainingSeconds = 30;
    _startCountdownTimer();
  }

  _changeNumberClicked() {
    Navigator.of(context).pop(true);
  }

  _verifyClicked() {
    if (_currentText.length == 4) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
        leading: null,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Text(
                'Verify your number',
                style: TextStyle(
                  fontSize: 24,
                  color: Constants.bumbleYellow,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Enter the 4 digit code we just sent to you to\nverify your account',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Center(
                child: Container(
                  width: 170,
                  child: PinCodeTextField(
                    length: 4,
                    obsecureText: false,
                    fieldHeight: 40,
                    fieldWidth: 40,
                    activeColor: Colors.black26,
                    inactiveColor: Colors.black26,
                    activeFillColor: Colors.black26,
                    selectedColor: Constants.bumbleYellow,
                    shape: PinCodeFieldShape.box,
                    borderWidth: 0.7,
                    onChanged: (value) => setState(() {
                      _currentText = value;
                    }),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 24),
              //     child: Text(
              //       _isFieldValid ? 'Password' : 'Wrong login or password',
              //       style: TextStyle(
              //         color: _isFieldValid ? Colors.black : Colors.red,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 8),
              // Theme(
              //   data: ThemeData(),
              //   child: TextField(
              //     onChanged: (_) => this.setState(() {
              //       _isFieldValid = true;
              //     }),
              //     autofocus: true,
              //     enableSuggestions: false,
              //     controller: _passwordTextController,
              //     focusNode: _passwordFocusNode,
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       focusedBorder: border,
              //       border: border,
              //       enabledBorder: border,
              //       errorBorder: border,
              //       filled: true,
              //       hintStyle: TextStyle(color: Colors.grey),
              //       fillColor: Colors.white70,
              //     ),
              //   ),
              // ),
              SizedBox(height: 24),
              FlatButton(
                color: Constants.bumbleYellow,
                onPressed: () => _verifyClicked(),
                child: SizedBox(
                  height: 50,
                  child: Container(
                    child: Center(
                        child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 18,
                        color: _currentText.length == 4
                            ? Colors.white
                            : Constants.bumbleBanana,
                      ),
                    )),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                textColor: Colors.white,
              ),
              SizedBox(height: 24),
              _remainingSeconds <= 0
                  ? FlatButton(
                      onPressed: () => showPlatformDialog(
                        context: context,
                        builder: (_) => PlatformAlertDialog(
                          title: Text('Didn\'t get the text?'),
                          content: Text(
                              '\n${widget.mobileNumber}\n\nWe sent the text to this number. If it isn\'t right you can change it now, orchoose to recieve a phone call instead.'),
                          actions: <Widget>[
                            PlatformDialogAction(
                              child: Text('Use Facebook instead'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            PlatformDialogAction(
                              child: Text('Use a phone call instead'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            PlatformDialogAction(
                              child: Text('Change number'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                            PlatformDialogAction(
                              child: Text('Send text again'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                _resetThenStartTimer();
                              },
                            ),
                          ],
                        ),
                      ),
                      child: Text(
                        'I didn\'t get the text',
                        style: TextStyle(
                          color: Constants.bumbleYellow,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : Text(
                      'Text to +63 ${widget.mobileNumber} should arrive within $_remainingSeconds sec.'),
              _remainingSeconds > 0
                  ? FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                      onPressed: () => _changeNumberClicked(),
                      child: Text(
                        'Change number',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
