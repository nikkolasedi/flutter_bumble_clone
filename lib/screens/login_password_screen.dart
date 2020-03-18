import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';
import 'package:flutter_bumble_clone/screens/forgot_password_screen.dart';
import 'package:flutter_bumble_clone/screens/main_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LoginPasswordScreen extends StatefulWidget {
  final String mobileNumber;

  LoginPasswordScreen({this.mobileNumber});

  @override
  _LoginPasswordScreenState createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  FocusNode _passwordFocusNode = FocusNode();

  bool _isFieldValid = true;

  @override
  void dispose() {
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
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
          icon: Icon(Icons.arrow_back_ios),
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
                  "Log in",
                  style: TextStyle(
                    fontSize: 24,
                    color: Constants.bumbleYellow,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Welcome back to Bumble! Fill out your\npassword and you'll be Bumbling in no time",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      _isFieldValid ? 'Password' : 'Wrong login or password',
                      style: TextStyle(
                        color: _isFieldValid ? Colors.black : Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Theme(
                  data: ThemeData(),
                  child: TextField(
                    onChanged: (_) => this.setState(() {
                      _isFieldValid = true;
                    }),
                    autofocus: true,
                    enableSuggestions: false,
                    controller: _passwordTextController,
                    focusNode: _passwordFocusNode,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: border,
                      border: border,
                      enabledBorder: border,
                      errorBorder: border,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                FlatButton(
                  color: _passwordTextController.text.isEmpty
                      ? Constants.bumbleBanana
                      : Constants.bumbleYellow,
                  onPressed: () => _logInClicked(),
                  child: SizedBox(
                    height: 50,
                    child: Container(
                      child: Center(
                          child: Text(
                        'Log In',
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
                FlatButton(
                  onPressed: () => _forgotPasswordClicked(),
                  child: Text(
                    "I've forgotten my password",
                    style: TextStyle(
                      color: Constants.bumbleYellow,
                      fontSize: 18,
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

  _logInClicked() {
    const String recognized = 'password';

    if (_passwordTextController.text == recognized) {
      FocusScope.of(context).unfocus();
      _navigateMainScreen();
    } else {
      setState(() {
        _passwordFocusNode.requestFocus();
        _isFieldValid = false;
      });
    }
  }

  _forgotPasswordClicked() {
    showPlatformDialog(
      context: context,
      builder: (context) {
        return PlatformAlertDialog(
          title: Text('Need to reset your password?'),
          content: Text(
              "Don't worry, we can use your cell phone number to get you back to Bumbling in no Time."),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            FlatButton(
              onPressed: () {
                print(widget.mobileNumber);
                final String mobileNumber = widget.mobileNumber;
                print(mobileNumber);
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForgotPasswordScreen(
                          mobileNumber: mobileNumber,
                        )));
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  _navigateMainScreen() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => MainScreen()),
      (route) => route.isFirst,
    );
  }
}
