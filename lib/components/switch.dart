import 'package:flutter/material.dart';

class _CustomTrack extends StatelessWidget {
  final Color color;

  _CustomTrack({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 42,
        height: 14,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36.5), color: color));
  }
}

class _CustomPin extends StatelessWidget {
  final Color color;

  _CustomPin({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.0,
      height: 28.0,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color, boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            spreadRadius: 1,
            offset: Offset(0, 3),
            blurRadius: 8),
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            spreadRadius: 1,
            offset: Offset(0, 1),
            blurRadius: 1),
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 1,
            offset: Offset(0, 3),
            blurRadius: 1),
      ]),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onTap;

  CustomSwitch({Key key, this.value, this.onTap}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            widget.onTap(widget.value);
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 30.0,
          width: 46.0,
          child: Stack(children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: 9.0,
              bottom: 9.0,
              left: 2.0,
              right: 2.0,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: _CustomTrack(
                      key: UniqueKey(),
                      color: widget.value ? Color(0xFF5775FF) : Colors.grey)),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: 1.0,
              bottom: 1.0,
              left: widget.value ? 16.0 : 0.0,
              right: widget.value ? 0.0 : 16.0,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: _CustomPin(key: UniqueKey(), color: Colors.white)),
            ),
          ]),
        ));
  }
}
