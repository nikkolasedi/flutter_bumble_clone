import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final String mobileNumber;

  ForgotPasswordScreen({this.mobileNumber});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _mobileTextController = TextEditingController();
  FocusNode _mobileFocusNode = FocusNode();
  Timer _timer;

  bool _isFieldValid = true;
  int _remainingSeconds = 30;

  @override
  void dispose() {
    _mobileTextController.dispose();
    _mobileFocusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startCountdownTimer();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: _isFieldValid ? Colors.grey : Colors.red,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.grey,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: <Widget>[
                Text(
                  "Verify your number?",
                  style: TextStyle(
                    fontSize: 24,
                    color: Constants.bumbleYellow,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Enter the 4 digit code we just sent you to verify your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 24),
                Theme(
                  data: ThemeData(),
                  child: TextField(
                    onChanged: (_) => this.setState(() {
                      _isFieldValid = true;
                    }),
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    enableSuggestions: false,
                    controller: _mobileTextController,
                    focusNode: _mobileFocusNode,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: border,
                      border: border,
                      enabledBorder: border,
                      errorBorder: border,
                      filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                      hintText: '1 2 3 4',
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                FlatButton(
                  color: _mobileTextController.text.isEmpty
                      ? Constants.bumbleBanana
                      : Constants.bumbleYellow,
                  onPressed: () => _verifyClicked(),
                  child: SizedBox(
                    height: 50,
                    child: Container(
                      child: Center(
                          child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 18),
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
                        onPressed: () => _smsNotRecievedClicked(),
                        child: Text(
                          "I didn't get the text",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Constants.bumbleYellow,
                          ),
                        ),
                      )
                    : Text(
                        'Text to +63 ${widget.mobileNumber} should arrive within $_remainingSeconds sec.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                FlatButton(
                  onPressed: () => _navigateToLoginMobileScreen(),
                  child: Text(
                    'Change number',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

  _verifyClicked() {}

  _smsNotRecievedClicked() {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Didn't get the text?"),
        content: Text(
            "\n${widget.mobileNumber}\n\nWe sent the text to this number. If it\n isn't right you can change it now, or\n choose to recieve a phone call instead."),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              print('not supported hahaha');
              Navigator.of(context).pop();
            },
            child: Text('Use a phone call instead'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _remainingSeconds = 30;
              });
              _startCountdownTimer();
            },
            child: Text('Send text again'),
          ),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToLoginMobileScreen();
              },
              child: Text(
                'Change number',
              ))
        ],
      ),
    );
  }

  // Navigations

  _navigateToLoginMobileScreen() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
