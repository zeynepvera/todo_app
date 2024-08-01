import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
  final Todo task;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*
            TO_dO: firebase islemlerinde duzeltilmesi gereken yerler
            widget.task.type == TaskType.note
                ? Image.asset("lib/assets/images/Category.png")
                : widget.task.type == TaskType.calendar
                    ? Image.asset("lib/assets/images/Category_2.png")
                    : Image.asset("lib/assets/images/Category_3.png"),*/

            Image.asset("lib/assets/images/Category.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.todo!,
                    style: TextStyle(
                      decoration: widget.task.completed!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("User ID: ${widget.task.userId!}"),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(() {
                  isChecked = val!;

                  widget.task.completed = !widget.task.completed!;
                }),
              },
            ),
          ],
        ),
      ),
    );
  }
}
