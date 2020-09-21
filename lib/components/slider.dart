import 'package:flutter/material.dart';
import 'package:test_med/functions/timeConvertion.dart';

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

class _CustomTrack extends StatelessWidget{
  final double width;
  final Color color;
  _CustomTrack({Key key, this.width, this.color}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.0,
      width: width,
      color: color,
    );
  }
}

class CustomSliderInput extends StatefulWidget{
  final TimeOfDay fromValue;
  final TimeOfDay toValue;
  final TimeOfDay step;
  final ValueChanged<DragUpdateDetails> onFromValueDrag;
  final ValueChanged<TapDownDetails> onFromValueTapDown;
  final ValueChanged<TapUpDetails> onFromValueTapUp;
  final ValueChanged<DragUpdateDetails> onToValueDrag;
  final ValueChanged<TapDownDetails> onToValueTapDown;
  final ValueChanged<TapUpDetails> onToValueTapUp;
  CustomSliderInput({Key key, this.fromValue, this.toValue, this.step, this.onFromValueDrag, this.onFromValueTapDown, this.onToValueDrag, this.onToValueTapDown, this.onFromValueTapUp, this.onToValueTapUp}) : super(key : key);

  @override
  _CustomSliderInputState createState() => _CustomSliderInputState();
}

class _CustomSliderInputState extends State<CustomSliderInput>{
  @override
  Widget build(BuildContext context) {
    double calculateWidth = MediaQuery.of(context).size.width - 10 - 10;
    double stepWidth = calculateWidth / (24.0 / timeToDouble(widget.step));
    double pin1Pos = timeToDouble(widget.fromValue) / timeToDouble(widget.step) * stepWidth;
    double pin2Pos = timeToDouble(widget.toValue) / timeToDouble(widget.step) * stepWidth;
    return Container(
      margin: EdgeInsets.only(left: 10, top: 252, right: 10),
      width: calculateWidth,
      height: 30,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 14),
            child: Stack(
              children: <Widget>[
                _CustomTrack(color: Color(0xFFC7C7CC), width: calculateWidth),
                Padding(
                  padding: EdgeInsets.only(left: pin1Pos),
                  child: _CustomTrack(color: Color(0xFF5775FF), width: pin2Pos - pin1Pos),
                )
              ]
            ),
          ),
          GestureDetector(
            onTapDown: (TapDownDetails details){
              widget.onFromValueTapDown(details);
            },
            onTapUp: (TapUpDetails details){
              widget.onFromValueTapUp(details);
            },
            onHorizontalDragUpdate: (DragUpdateDetails details){
              widget.onFromValueDrag(details);
            },
            child: Padding(
                  padding: EdgeInsets.only(left: pin1Pos),
                  child: _CustomPin(color: Colors.white),
                ),
          ),
          GestureDetector(
            onTapDown: (TapDownDetails details){
              widget.onToValueTapDown(details);
            },
            onTapUp: (TapUpDetails details){
              widget.onToValueTapUp(details);
            },
            onHorizontalDragUpdate: (DragUpdateDetails details){
              widget.onToValueDrag(details);
            },
            child: Padding(
                  padding: EdgeInsets.only(left: pin2Pos),
                  child: _CustomPin(color: Colors.white),
                ),
          ),
      ]),
    );
  }
  
}