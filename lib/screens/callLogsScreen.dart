import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_dm/models/call_logs.dart';

class CallLogs extends StatefulWidget {
  const CallLogs({Key key}) : super(key: key);

  @override
  _CallLogsState createState() => _CallLogsState();
}

class _CallLogsState extends State<CallLogs> with WidgetsBindingObserver {
  Iterable<CallLogEntry> entries;
  bool permission = false;

  // PhoneTextField pt = new PhoneTextField();
  Logs cl = Logs();

  Future<Iterable<CallLogEntry>> logs;

  checkLogsPermission() async {
    if (await Permission.phone.request().isGranted) {
      setState(() {
        permission = true;
      });
    } else {
      print('Provide Phone permission to make a call and view logs.');
      setState(() {
        permission = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    logs = cl.getCallLogs();
    checkLogsPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (AppLifecycleState.resumed == state) {
      setState(() {
        logs = cl.getCallLogs();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // pt,
          //TextField(controller: t1, decoration: InputDecoration(labelText: "Phone number", contentPadding: EdgeInsets.all(10), suffixIcon: IconButton(icon: Icon(Icons.phone), onPressed: (){print("pressed");})),keyboardType: TextInputType.phone, textInputAction: TextInputAction.done, onSubmitted: (value) => call(value),),
          if (permission)
            FutureBuilder(
                future: logs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final Iterable<CallLogEntry> entries = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Card(
                              child: ListTile(
                                leading: cl.getCallIcon(entries.elementAt(index).callType),
                                title: cl.getTitle(entries.elementAt(index)),
                                subtitle: Text(
                                    "${cl.formatDate(DateTime.fromMillisecondsSinceEpoch(entries.elementAt(index).timestamp))}\n${cl.getTime(entries.elementAt(index).duration)}"),
                                isThreeLine: true,
                                trailing: IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.whatsapp,
                                    ),
                                    color: Colors.green,
                                    onPressed: () {
                                      // cl.call(entries.elementAt(index).number);
                                    }),
                              ),
                            ),
                          );
                        },
                        itemCount: entries.length,
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })
          else
            const Center(
              child: Text('Check  permissions'),
            )
        ],
      ),
    );
  }
}
