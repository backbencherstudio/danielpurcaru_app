import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../data/model/day_records.dart';

void showEarningDialog(BuildContext context, DayRecord record) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(
          "Details for - ${DateFormat('MMM d').format(record.date)}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.blue),
              title: Text("Date"),
              subtitle: Text(DateFormat('MMM d').format(record.date)),
            ),
            ListTile(
              leading: Icon(Icons.access_time, color: Colors.orange),
              title: Text("Total Hours"),
              subtitle: Text(record.totalHoursDaily),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on, color: Colors.green),
              title: Text("Earning"),
              subtitle: Text("\$${record.earningDaily.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
          ),
        ],
      );
    },
  );
}
