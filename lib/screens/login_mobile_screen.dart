import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';
import 'package:flutter_bumble_clone/screens/login_password_screen.dart';
import 'package:flutter_bumble_clone/screens/verify_number_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_codes.dart';
import 'package:country_code_picker/selection_dialog.dart';

class LoginMobileScreen extends StatefulWidget {
  @override
  _LoginMobileScreenState createState() => _LoginMobileScreenState();
}

class _LoginMobileScreenState extends State<LoginMobileScreen> {
  TextEditingController _mobileTextController = TextEditingController();
  FocusNode _mobileFocusNode = FocusNode();
  CountryCode countryCode = new CountryCode(dialCode: "+62",code: "ID");


  bool _isFieldValid = true;

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
                  "What's your number?",
                  style: TextStyle(
                    fontSize: 24,
                    color: Constants.bumbleYellow,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Whether you're creating an account or\nsigning back in, let's start with your number",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      _isFieldValid
                          ? 'Cell phone number'
                          : 'Please check your number',
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
                    onChanged: (_) => {this.setState(() {
                      _isFieldValid = true;
                    }),
                    _onCountryChange,
                    },
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
                        child: CountryCodePicker(
                          onChanged: _onCountryChange,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: '+62',
                          favorite: ['+62','+60','+65'],
                          // optional. Shows only country name and flag
                          showCountryOnly: true,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                        /*child:
                        Center(
                          child: Text('+63'),
                          widthFactor: 0,

                        ),*/
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                FlatButton(
                  color: _mobileTextController.text.isEmpty
                      ? Constants.bumbleBanana
                      : Constants.bumbleYellow,
                  onPressed: () => _continueClicked(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  _continueClicked() {
    const String recognized = '123456789';

    if (_mobileTextController.text == recognized) {
      FocusScope.of(context).unfocus();
      _navigateToLoginPasswordScreen();
    } else if (_mobileTextController.text.length != recognized.length) {
      setState(() {
        _mobileFocusNode.requestFocus();
        _isFieldValid = false;
      });
    } else {
      FocusScope.of(context).unfocus();
      showPlatformDialog(
        context: context,
        builder: (context) {
          return PlatformAlertDialog(
            title: Text('Phone Number Confirmation'),
            content: Text(
                "We'll send a verification code to the following number:\n${countryCode.toString() + _mobileTextController.text}"),
            actions: <Widget>[
              PlatformDialogAction(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              PlatformDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  _navigateToVerifyNumberScreen();
                },
                child: Text('Confirm'),
              ),
            ],
          );
        },
      );
    }
  }

  // Navigations

  _navigateToLoginPasswordScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginPasswordScreen(
              mobileNumber: countryCode.toString() + _mobileTextController.text,
            )));
  }

  _navigateToVerifyNumberScreen() async {
    bool shouldReset = await Navigator.of(context).push<bool>(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => VerifyNumberScreen(
        mobileNumber: countryCode.toString() + _mobileTextController.text,
      ),
    ));

    if (shouldReset) {
      setState(() {
        _mobileTextController.clear();
      });
    }
  }

  void _onCountryChange(CountryCode countryCode1) {
    //TODO : manipulate the selected country code here
    countryCode = countryCode1;
  }
}
