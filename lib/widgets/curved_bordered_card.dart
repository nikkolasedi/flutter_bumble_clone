import 'package:flutter/material.dart';

class CurvedBorderedCard extends StatelessWidget {
  final Widget child;
  CurvedBorderedCard({this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Container(
            color: Colors.white,
            child: child,
          ),
        ),
      ),
    );
  }
}
