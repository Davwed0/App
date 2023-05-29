import 'package:todo/modals/date_entry_modal.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List<DateEntry> dateList = [];

  final _database = Hive.box("database");

  void loadData() {
    dateList = _database.get("DATELIST");
  }

  void updateData() {
    _database.put("DATELIST", _database);
  }

  void generateInitData() {
    _database.put("DATELIST", [
      DateEntry(date: "2023-05-22", status: "past", toDoList: [
        ["Design Dribbble concept", false, "Work"],
        ["Make dinner", false, "Lifestyle"],
        ["Planning next week", true, "Personal"],
        ["Work on design system", true, "Work"],
      ]),
      DateEntry(date: "2023-05-23", status: "past", toDoList: []),
      DateEntry(date: "2023-05-24", status: "past", toDoList: []),
      DateEntry(date: "2023-05-25", status: "past", toDoList: []),
      DateEntry(date: "2023-05-26", status: "today", toDoList: [
        ["Design Dribbble concept", false, "Work"],
        ["Make dinner", false, "Lifestyle"],
        ["Planning next week", true, "Personal"],
        ["Work on design system", true, "Work"],
      ]),
      DateEntry(date: "2023-05-27", status: "tommorow", toDoList: [
        ["Call dad", false, "Personal"],
        ["Study LOTR", false, "No list"],
        ["Wash dishes", true, "No list"],
      ]),
      DateEntry(date: "2023-05-28", status: "future", toDoList: [
        ["Public case study", false, "No list"],
        ["Make lunch", false, "No list"],
      ]),
    ]);
  }
}
