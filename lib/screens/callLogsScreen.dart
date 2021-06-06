import 'package:flutter/material.dart';

class CallLogs extends StatefulWidget {
  const CallLogs({Key key}) : super(key: key);

  @override
  _CallLogsState createState() => _CallLogsState();
}

class _CallLogsState extends State<CallLogs> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Call logs'),
      ),
    );
  }
}
