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
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Container(
            color: Colors.white,
            child: DefaultTextStyle(
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 17,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
