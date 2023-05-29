import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTile extends StatelessWidget {
  final String date;
  final String status;

  const DateTile({super.key, required this.date, required this.status});

  Color? getTextColor(DateTime time) {
    switch (status) {
      case "past":
        {
          return const Color(0xFFC0C3C9);
        }
      case "today":
        {
          return const Color(0xFF00A86B);
        }
      case ("future" || "tommorow"):
        {
          return const Color(0xFF0E100F);
        }
      default:
        {
          return const Color(0xFFC0C3C9);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tileDate = DateFormat('yyyy-MM-dd').parse(date);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 45,
        decoration: status == "today"
            ? const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFF00A86B))))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${tileDate.day}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.8,
                  color: getTextColor(tileDate)),
            ),
            Text(
              DateFormat('EEE').format(tileDate),
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                  color: getTextColor(tileDate)),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
