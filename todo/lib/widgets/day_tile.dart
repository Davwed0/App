import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/modals/date_entry_modal.dart';
import 'to_do_tile.dart';

class DayTile extends StatefulWidget {
  final DateEntry dateEntry;
  final Function checkBoxState;

  const DayTile(
      {super.key, required this.dateEntry, required this.checkBoxState});

  @override
  State<StatefulWidget> createState() => _DayTileState();
}

class _DayTileState extends State<DayTile> {
  @override
  Widget build(BuildContext context) {
    final date = DateFormat('yyyy-MM-dd').parse(widget.dateEntry.date);
    final List toDoList = widget.dateEntry.toDoList;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(color: Color(0xFFF1F3F3), width: 1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Today",
                style: TextStyle(
                    color: Color(0xFF7E8491),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.6),
              ),
              Container(
                width: 4,
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF1F3F3)),
              ),
              Text(
                DateFormat('EEEE').format(date),
                style: const TextStyle(
                    color: Color(0xFF7E8491),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.6),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              tileText: toDoList[index][0],
              done: toDoList[index][1],
              tileCategory: toDoList[index][2],
              checkBoxState: (value) => widget.checkBoxState(value, index),
            );
          },
        )
      ],
    );
  }
}
