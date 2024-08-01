import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<String> todo = ["Study Lessons", "Run 5k", "Go to party"];
  //List<String> completed = ["Game meetup", "Take out trash"];

  List<Task> todo = [
    Task(
        type: TaskType.note,
        title: "Study Lessons",
        description: "Study SEN211",
        isCompleted: false),
    Task(
        type: TaskType.calendar,
        title: "Go to party",
        description: "Attend to party",
        isCompleted: false),
    Task(
        type: TaskType.contest,
        title: "Run 5k",
        description: "Run 5 kilometers",
        isCompleted: false),
  ];

  List<Task> completed = [
    Task(
        type: TaskType.calendar,
        title: "Go to party",
        description: "Attend to party",
        isCompleted: false),
    Task(
        type: TaskType.contest,
        title: "Run 5k",
        description: "Run 5 kilometers",
        isCompleted: false),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    todoService.getUncompletedTodos();

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              //HEADER
              Container(
                width: deviceWidth,
                height: deviceHeight / 3,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage(
                          "lib/assets/images/Ellipse 1.png",
                        ),
                        fit: BoxFit.cover)),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "20 JULY 2024",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        "My Todo List",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //TOP COLUMN
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 25, 10),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.getUncompletedTodos(),
                      builder: (context, snapshot) {
                        //print(snapshot.data);
                        if (snapshot.data == null) {
                          return const CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            primary: false, //önceligin o olmadıgını bilsin
                            shrinkWrap:
                                true, //sadece ona tahsis edilen yeri kullansın diye
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Todoitem(
                                task: snapshot.data![index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),

              //COMPLETED TEXT
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //BOTTOM COLUMN

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 25, 10),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.getCompletedTodos(),
                      builder: (context, snapshot) {
                        //print(snapshot.data);
                        if (snapshot.data == null) {
                          return const CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            primary: false, //önceligin o olmadıgını bilsin
                            shrinkWrap:
                                true, //sadece ona tahsis edilen yeri kullansın diye
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Todoitem(
                                task: snapshot.data![index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),

              //BOTTOM BUTTON
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddNewTask(
                          addNewTask: (newTask) => addNewTask(newTask),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Add New Task",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
