import 'package:flutter/material.dart';
import 'package:todo/widgets/date_tile.dart';
import 'package:todo/widgets/day_tile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo/widgets/add_button.dart';
import 'package:todo/modals/date_entry_modal.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/databases/database_local.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<StatefulWidget> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _database = Hive.box("database");
  final ToDoDatabase db = ToDoDatabase();

  final _taskInputController = TextEditingController();
  final _dateInputController = TextEditingController();

  @override
  void initState() {
    Hive.registerAdapter(DateEntryAdapter());
    if (_database.get("DATELIST") == null) {
      db.generateInitData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DateEntry> filteredDates = db.dateList
        .where((entry) => entry.toDoList.isNotEmpty || entry.status != "past")
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      bottomNavigationBar: BottomAppBar(
        height: 88,
        color: const Color(0xFFFFFFFF),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => {}, icon: const Icon(Iconsax.menu_1)),
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(Iconsax.search_normal)),
              ],
            ),
            AddButton(
              taskInputController: _taskInputController,
              dateInputController: _dateInputController,
              addTask: () {
                setState(() {
                  for (int i = 0; i < db.dateList.length; i++) {
                    if (db.dateList[i].date == _dateInputController.text) {
                      db.dateList[i].toDoList
                          .add([_taskInputController.text, false, "No list"]);
                    }
                  }
                  Navigator.of(context).pop();
                });
                db.updateData();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text("Good morning 👋",
                        style: TextStyle(
                          color: Color(0xFF0E100F),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.6,
                        )),
                  ]),
                  IconButton.outlined(
                    color: const Color(0xFFF1F3F3),
                    padding: const EdgeInsets.all(12),
                    icon: const Icon(
                      Iconsax.notification,
                      color: Color(0xFF7E8491),
                      size: 24,
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 64,
                decoration: const BoxDecoration(
                    border: BorderDirectional(
                        bottom:
                            BorderSide(color: Color(0xFFF1F3F3), width: 1))),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: db.dateList.length,
                  itemBuilder: ((context, index) {
                    return DateTile(
                        date: db.dateList[index].date,
                        status: db.dateList[index].status);
                  }),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: filteredDates.length,
                      itemBuilder: ((context, index) {
                        return DayTile(
                            dateEntry: filteredDates[index],
                            checkBoxState: (bool? value, int index) {
                              setState(() {
                                filteredDates[index].toDoList[index][1] =
                                    !filteredDates[index].toDoList[index][1];
                              });
                            });
                      }))),
              Container(
                height: 3,
                color: const Color(0xFFF1F3F3),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
