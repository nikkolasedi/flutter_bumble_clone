import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';

class LoginMobileScreen extends StatefulWidget {
  @override
  _LoginMobileScreenState createState() => _LoginMobileScreenState();
}

class _LoginMobileScreenState extends State<LoginMobileScreen> {
  @override
  Widget build(BuildContext context) {
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
                    child: Text('Cell phone number'),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: '1234567890',
                    fillColor: Colors.white70,
                    // prefixText: ,
                    prefixIcon: SizedBox(
                      child: Center(
                        child: Text('+63'),
                        widthFactor: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                FlatButton(
                  color: Constants.bumbleYellow,
                  onPressed: () => _onContinueClicked(),
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

  _onContinueClicked() {}
}
