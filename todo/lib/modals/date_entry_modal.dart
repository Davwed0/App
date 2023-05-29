import 'package:hive_flutter/hive_flutter.dart';
part 'date_entry_modal.g.dart';

@HiveType(typeId: 1, adapterName: "DateEntryAdapter")
class DateEntry {
  @HiveField(0)
  String date;
  @HiveField(1)
  String status;
  @HiveField(2)
  List toDoList;

  DateEntry({required this.date, required this.status, required this.toDoList});
}
