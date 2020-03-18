import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';
import 'package:flutter_bumble_clone/screens/login_password_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final String mobileNumber;

  ForgotPasswordScreen({this.mobileNumber});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _mobileTextController = TextEditingController();
  FocusNode _mobileFocusNode = FocusNode();

  bool _isFieldValid = true;
  int _remainingSeconds = 18;

  @override
  void dispose() {
    _mobileTextController.dispose();
    _mobileFocusNode.dispose();
    super.dispose();
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
                    decoration: InputDecoration(
                      focusedBorder: border,
                      border: border,
                      enabledBorder: border,
                      errorBorder: border,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: '1234567890',
                      fillColor: Colors.white70,
                      prefixIcon: SizedBox(
                        child: Center(
                          child: Text('+63'),
                          widthFactor: 0,
                        ),
                      ),
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
                Text(
                    'Text to +63 ${widget.mobileNumber} should arrive within $_remainingSeconds sec.'),
                FlatButton(
                  onPressed: () => _navigateToLoginMobileScreen(),
                  child: Text('Change number',
                      style: TextStyle(decoration: TextDecoration.underline)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _verifyClicked() {}

  // Navigations

  _navigateToLoginMobileScreen() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
