import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Logs {
  getCallIcon(CallType callType) {
    switch (callType) {
      case CallType.rejected:
        return const Icon(
          Icons.call_missed,
          color: Colors.orange,
        );
      case CallType.blocked:
        return const Icon(
          Icons.block_rounded,
          color: Colors.red,
        );
      case CallType.outgoing:
        return const Icon(
          Icons.call_made_rounded,
          color: Colors.black,
        );
      case CallType.incoming:
        return const Icon(
          Icons.call_received_rounded,
          color: Colors.green,
        );
      //rejected
      case CallType.unknown:
        return const Icon(
          Icons.call_missed,
          color: Colors.red,
        );
      default:
        return const Icon(
          Icons.call_received_rounded,
          color: Colors.blueGrey,
        );
    }
  }

  Future<Iterable<CallLogEntry>> getCallLogs() {
    return CallLog.get();
  }

  String formatDate(DateTime dt) {
    return DateFormat('d-MMM-y\nh:m:s').format(dt);
  }

  getTitle(CallLogEntry entry) {
    if (entry.name == null) return Text(entry.number);
    if (entry.name.isEmpty) {
      return Text(entry.number);
    } else {
      return Text(entry.name);
    }
  }

  String getTime(int duration) {
    final Duration d1 = Duration(seconds: duration);
    String formattedDuration = "";
    if (d1.inHours > 0) {
      formattedDuration += "${d1.inHours}h ";
    }
    if (d1.inMinutes > 0) {
      formattedDuration += "${d1.inMinutes}m ";
    }
    if (d1.inSeconds > 0) {
      formattedDuration += "${d1.inSeconds}s";
    }
    if (formattedDuration.isEmpty) return "0s";
    return formattedDuration;
  }
}
