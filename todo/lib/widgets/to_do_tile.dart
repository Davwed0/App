import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String tileText;
  final String tileCategory;
  final bool done;
  final Function(bool?)? checkBoxState;

  const ToDoTile(
      {super.key,
      required this.tileText,
      required this.done,
      required this.tileCategory,
      required this.checkBoxState});

  Color getCategoryColor(String tileCategory) {
    switch (tileCategory) {
      case "Work":
        {
          return const Color(0xFFF4AF25);
        }
      case "Lifestyle":
        {
          return const Color(0xFF00A86B);
        }
      case "Personal":
        {
          return const Color(0xFF037FFF);
        }
      default:
        {
          return const Color(0xFFC0C3C9);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 1,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    checkColor: Colors.white,
                    activeColor: const Color(0xFF7E8491),
                    side: const BorderSide(width: 2, color: Color(0xFF7E8491)),
                    value: done,
                    onChanged: checkBoxState,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(tileText,
                  style: TextStyle(
                      color: const Color(0xFF0E100F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.42,
                      decoration: (done ? TextDecoration.lineThrough : null))),
            ],
          ),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: getCategoryColor(tileCategory),
                    width: 2.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(tileCategory,
                  style: TextStyle(
                      color: const Color(0xFF0E100F),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                      decoration: (done ? TextDecoration.lineThrough : null))),
            ],
          ),
        ],
      ),
    );
  }
}
