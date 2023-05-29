import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddButton extends StatelessWidget {
  final TextEditingController taskInputController;
  final TextEditingController dateInputController;
  final Function() addTask;

  const AddButton(
      {super.key,
      required this.taskInputController,
      required this.dateInputController,
      required this.addTask});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 24,
        icon: const Icon(
          Iconsax.add,
          color: Colors.white,
        ),
        splashRadius: 28,
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(
          minWidth: 56,
          minHeight: 56,
        ),
        style: IconButton.styleFrom(
            backgroundColor: const Color(0xFF00A86B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            )),
        onPressed: () {
          showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (BuildContext context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    width: 1, color: Color(0xFF0E100F)))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Write your task",
                                  ),
                                  controller: taskInputController),
                              TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type date in yyyy-MM-dd format",
                                  ),
                                  controller: dateInputController),
                            ],
                          ),
                        )),
                    IconButton(
                      iconSize: 24,
                      icon: const Icon(
                        Iconsax.add,
                        color: Colors.white,
                      ),
                      splashRadius: 28,
                      padding: const EdgeInsets.all(16),
                      constraints: const BoxConstraints(
                        minWidth: 56,
                        minHeight: 56,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: const Color(0xFF00A86B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          )),
                      onPressed: () => addTask(),
                    ),
                  ],
                );
              });
        });
  }
}
