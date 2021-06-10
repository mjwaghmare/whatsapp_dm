import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Logs {
  getCallIcon(CallType callType) {
    switch (callType) {
      case CallType.rejected:
        return IconButton(
          icon: const Icon(
            Icons.call_missed,
            color: Colors.orange,
          ),
          onPressed: () {},
        );
      case CallType.blocked:
        return IconButton(
          icon: const Icon(
            Icons.block_rounded,
            color: Colors.red,
          ),
          onPressed: () {},
        );
      case CallType.outgoing:
        return IconButton(
          icon: const Icon(
            Icons.call_made_rounded,
            color: Colors.black,
          ),
          onPressed: () {},
        );
      case CallType.incoming:
        return IconButton(
          icon: const Icon(
            Icons.call_received_rounded,
            color: Colors.green,
          ),
          onPressed: () {},
        );
      //rejected
      case CallType.unknown:
        return IconButton(
          icon: const Icon(
            Icons.call_missed,
            color: Colors.red,
          ),
          onPressed: () {},
        );
      default:
        return IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.call_received_rounded,
            color: Colors.blueGrey,
          ),
        );
    }
  }

  Future<Iterable<CallLogEntry>> getCallLogs() {
    return CallLog.get();
  }

  String formatDate(DateTime dt) {
    return DateFormat('dd-MMM-y\nh:m a').format(dt);
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
