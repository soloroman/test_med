import 'package:flutter/material.dart';
import 'package:test_med/components/intervalSelection.dart';
import 'package:test_med/components/panel.dart';
import 'package:test_med/components/switch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Color(0xFFE5E5E5)),
      home: MainPage(),
    );
  }
}

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        margin: EdgeInsets.only(
          top: 24,
          left: 20,
        ),
        height: 23,
        width: 250,
        child: Text(
          "График работы",
          style: TextStyle(
              color: Color(0xFF464850),
              fontSize: 20.0,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.normal),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: 71,
          left: 20,
        ),
        height: 36,
        width: MediaQuery.of(context).size.width - 60,
        child: Text(
          "Укажите время, когда вы доступны для звонков и сможете быстро отвечать пациентам",
          style: TextStyle(
              color: Color(0xFF373D47).withOpacity(0.6),
              fontSize: 13.0,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w500),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 125, left: 20),
        child: Row(
          children: [
            Container(
              width: 267,
              height: 22,
              child: Text(
                "Понедельник",
                style: TextStyle(
                    color: Color(0xFF373D47),
                    fontSize: 17.0,
                    letterSpacing: -0.41,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width - 20 - 267 - 50 - 20),
              width: 46,
              height: 30,
              child: CustomSwitch(
                  value: isSwitched,
                  onTap: (value) {
                    setState(() {
                      isSwitched = !isSwitched;
                    });
                    print(isSwitched);
                  }),
            )
          ],
        ),
      ),
      // IntervalSelection(
      //   from: TimeOfDay(hour: 3, minute: 0),
      //   to: TimeOfDay(hour: 22, minute: 0)
      // )
    ]);
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panel: TimeTable(),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        backdropEnabled: false,
        boxShadow: [
          BoxShadow(
              blurRadius: 16.0, color: Color(0xFFF2F5F8), offset: Offset(0, 6)),
        ],
        maxHeight: MediaQuery.of(context).size.height - 51,
        minHeight: 70,
      ),
    );
  }
}
