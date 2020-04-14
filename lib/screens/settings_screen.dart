import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';
import 'package:flutter_bumble_clone/widgets/curved_bordered_card.dart';
import 'package:flutter_bumble_clone/widgets/edged_range_slider.dart';
import 'package:flutter_bumble_clone/widgets/edged_slider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  RangeValues _ageSliderValue = RangeValues(30, 40);
  double _distanceSliderValue = 2;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        leading: Align(
          widthFactor: 1,
          alignment: Alignment.center,
          child: CupertinoButton(
            padding: EdgeInsets.all(10),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        middle: Text('Settings'),
        trailing: CupertinoButton(
          padding: EdgeInsets.all(10),
          child: Text(
            'Done',
            style: TextStyle(
              color: Constants.bumbleYellow,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: Container(
        constraints: BoxConstraints.expand(),
        color: CupertinoColors.systemGroupedBackground,
        child: SafeArea(
          child: SingleChildScrollView(
            child: DefaultTextStyle(
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 14,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 12),
                    CurvedBorderedCard(child: Text('Snooze Mode')),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 6, 12, 24),
                      child: Text(
                          'Turning this on will hide you from all of Bumble\'s modes for as long as you choose. Your existing matches will remain accesible.',
                          style: TextStyle(color: Colors.grey)),
                    ),
                    title('Filters'),
                    CurvedBorderedCard(
                        child: Text('Set advanced Date filters')),
                    SizedBox(height: 12),
                    title('I\'m interested in...'),
                    CurvedBorderedCard(child: Text('Men')),
                    SizedBox(height: 6),
                    CurvedBorderedCard(child: Text('Women')),
                    SizedBox(height: 6),
                    CurvedBorderedCard(child: Text('Everyone')),
                    SizedBox(height: 12),
                    title('Age'),
                    Stack(
                      children: <Widget>[
                        CurvedBorderedCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Between ${_ageSliderValue.toInt()} and 29
                              Text(
                                  'Between ${_ageSliderValue.start.toInt()} and ${_ageSliderValue.end.toInt()}'),
                              EdgedRangeSlider(
                                min: 18,
                                max: 99,
                                values: _ageSliderValue,
                                onChanged: (values) => setState(() {
                                  this._ageSliderValue = values;
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),
                    title('Distance'),
                    CurvedBorderedCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'Up to ${_distanceSliderValue.toInt()} kilometers away'),
                          EdgedSlider(
                            min: 2,
                            max: 80,
                            value: _distanceSliderValue,
                            onChanged: (value) => setState(() {
                              this._distanceSliderValue = value;
                            }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    CurvedBorderedCard(
                      child: Text('Notification Settings'),
                    ),
                    SizedBox(height: 12),
                    //  Row(
                    //   children: <Widget>[
                    //     CurvedBorderedCard(
                    //       child: Text('Notification Settings'),
                    //     ),
                    //     CurvedBorderedCard(
                    //       child: Text('Notification Settings'),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget title(String text) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: Text(text),
        )
      ],
    );
  }
}
