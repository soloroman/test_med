import 'package:flutter/material.dart';
import 'package:test_med/components/interval.dart';
import 'package:test_med/components/slider.dart';

class IntervalSelection extends StatefulWidget{
  final TimeOfDay from;
  final TimeOfDay to;
  IntervalSelection({Key key, this.from, this.to}) : super(key : key);
  @override
  _IntervalSelectionState createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  double pin1Pos = 0.0;
  double pin2Pos = 100.0;
  bool glowFrom = false;
  bool glowTo = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IntervalFromTo(from: widget.from, to: widget.to, glowFrom: glowFrom, glowTo: glowTo),
        CustomSliderInput(
          fromValue: widget.from,
          onFromValueTapDown: (details){
            setState(() {
              glowFrom = true;
            });
          },
          onFromValueTapUp: (details){
            setState(() {
              glowFrom = false;
            });
          },
          onFromValueDrag: (details){

          },
          toValue: widget.to,
          onToValueTapDown: (details){
            setState(() {
              glowTo = true;
            });
          },
          onToValueTapUp: (details){
            setState(() {
              glowTo = false;
            });
          },
          onToValueDrag: (details){
            
          },
      ),
      ]
    );
  }
}