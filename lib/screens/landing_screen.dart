import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';
import 'package:flutter_bumble_clone/screens/login_mobile_screen.dart';
import 'package:flutter_bumble_clone/utils.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bumbleYellow,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Spacer(),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/icon_white.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: SizedBox(
                height: 44,
                child: Image.asset('assets/logo_white.png'),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: FlatButton(
                color: Colors.white,
                onPressed: () => _onFacebookLoginClicked(),
                child: SizedBox(
                  height: 50,
                  child: Container(
                    child: Center(
                        child: Text(
                      'Continue with Facebook',
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                textColor: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            FlatButton(
              onPressed: () => _onMobileNumberLoginClicked(context),
              child: Text(
                'Use cell phone number',
                style: TextStyle(fontSize: 18),
              ),
              textColor: Colors.white,
            ),
            SizedBox(height: 36),
            Text(
              "Don't worry! We never post to Facebook.",
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Terms of Service',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 0, right: 0),
                  onPressed: () => _onTermsClicked(),
                ),
                SizedBox(width: 12),
                FlatButton(
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 0, right: 0),
                  onPressed: () => _onPrivacyPolicyClicked(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onTermsClicked() {
    Utils.openUrl(Constants.termsAndConditionsUrl);
  }

  _onPrivacyPolicyClicked() {
    Utils.openUrl(Constants.privacyPolicyUrl);
  }

  _onFacebookLoginClicked() {
    print('lmao3');
  }

  _onMobileNumberLoginClicked(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => LoginMobileScreen()));
  }
}
