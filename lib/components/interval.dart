import 'package:flutter/material.dart';
import 'package:test_med/functions/timeConvertion.dart';

class _CustomIntervalInput extends StatelessWidget {
  final TimeOfDay value;
  final bool glow;
  _CustomIntervalInput({Key key, this.value = const TimeOfDay(hour: 0, minute: 0), this.glow}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 141,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
              width: 1.0, color: glow ? Colors.blue : Color(0xFFBFBFD5).withOpacity(0.6))),
      child: Container(
          child: Text(
        timeToDouble(value).toString(),
        style: TextStyle(
          color: Color(0xFF373D47),
          fontSize: 17.0,
          letterSpacing: -0.41,
          fontFamily: "Ubuntu",
          fontWeight: FontWeight.w500,
        ),
      ),
      alignment: Alignment.center
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var calculateWidth = MediaQuery.of(context).size.width - 10 - 10 - 141 - 10 - 10 - 10 - 141 - 10;
    return Container(
      width: calculateWidth <= 0 ? 0 : calculateWidth,
      height: 1,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
              width: 0.5, color: Color(0xFFBFBFD5))),
    );
  }
  
}

class IntervalFromTo extends StatelessWidget{
  final TimeOfDay from;
  final TimeOfDay to;
  final bool glowFrom;
  final bool glowTo;
  
  IntervalFromTo({Key key, this.from, this.to, this.glowFrom, this.glowTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 174, left: 10),
      child: Row(
      children: <Widget>[
        _CustomIntervalInput(value: from, glow: glowFrom ),
        _CustomDivider(),
        _CustomIntervalInput(value: to, glow: glowTo )
      ])
    );
  }

}