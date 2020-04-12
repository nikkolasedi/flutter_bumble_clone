import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';

class EdgedRangeSlider extends StatelessWidget {
  final double min;
  final double max;
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;

  EdgedRangeSlider({
    this.min,
    this.max,
    this.values,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: this.min,
      max: this.max,
      values: this.values,
      onChanged: this.onChanged,
      activeColor: Constants.bumbleYellow,
    );
  }
}
