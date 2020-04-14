import 'package:flutter/material.dart';
import 'package:flutter_bumble_clone/constants.dart';
import 'package:flutter_bumble_clone/helpers/custom_track_shape.dart';

class EdgedSlider extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  final ValueChanged<double> onChanged;

  EdgedSlider({
    this.min,
    this.max,
    this.value,
    this.onChanged,
  });

  double get _modifiedMin {
    return min - 2;
  }

  double get _modifiedMax {
    return max - 2;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Constants.bumbleYellow,
        inactiveTrackColor: Colors.grey,
        trackHeight: 2,
        thumbColor: Constants.bumbleYellow,
        trackShape: CustomTrackShape(),
      ),
      child: Slider(
        min: this._modifiedMin,
        max: this._modifiedMax,
        value: this.value,
        onChanged: (value) {
          if (value >= this.min && value <= this.max) {
            this.onChanged(value);
          }
        },
      ),
    );
  }
}
