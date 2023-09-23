import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 

import 'package:todo/widget/notification.dart';
 
import '../provider/todoprovider.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';
 
 
import 'package:intl/intl.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  @override
  void initState() {
    
    super.initState();
    NotificationWidget.init();
  }

  bool check = true;

  DrawerControl drawerControl = DrawerControl();
 
  final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
  final DateFormat timeFormatter = DateFormat('hh:mm a');

  Widget build(BuildContext context) {
    //  DrawerControl drawerControl = DrawerControl();
    final todolist = Provider.of<TodoProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 49, 83),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 11, 111, 192),
          leading: const  Icon(
            Icons.check_circle,
            size: 40,
            color: Colors.white70,
          ),
          title: const  Text(
            "Todo List",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: ListView.builder(
     
        itemCount: todolist.todos.length,

        itemBuilder: (context, index) {
          final task = todolist.todos[index];

          if (task.completionTime != null) {
            final notificationTime =
                task.completionTime!.subtract(Duration(minutes: 2));

            
            NotificationWidget.showScheduleNotification(
              title: " Task  Deadline reached after 2 minuts ",
              body: task.title + " , is not completed Yet",

              id: index,
               // Use a unique ID for each task
              scheduleTime: notificationTime,
        
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 20, 75, 120),
                  boxShadow: const [
                    BoxShadow(color: Colors.white, blurRadius: 6)
                  ],
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(children: [
                Positioned(
                    top: 10,
                    left: 60,
                    right: 10,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Task ${index + 1}:",
                          style:  const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          // TextSpan(text: "Title:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.white70)),
                          TextSpan(
                              text: task.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.white70))
                        ]))
                      ],
                    )),
                Positioned(
                  top: 0,
                  left: 0,
                  //  right: 0,
                  child: Checkbox(
                    side: const BorderSide(color: Colors.white),
                    //  materialTapTargetSize:,
                    checkColor: Colors.white,
                    hoverColor: Colors.yellow,
                    activeColor: Colors.green,
                    // fillColor: Colors.pink,

                    value: task.isdone,
                    onChanged: (_) {
                      todolist.toggleTaskStatus(index);
                    },
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 246, 63, 50),
                      size: 40,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title:  const Text("Are You Sure ?"),
                              actions: [
                                CupertinoButton(
                                    child: Text("No"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                CupertinoButton(
                                    child:  const Text("Yes"),
                                    onPressed: () {
                                  

                                      todolist.removetodo(index);
                                     ;

                                      Navigator.pop(context);
                                    })
                              ],
                            );
                          });
                      

                      
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: task.completionTime != null
                      ? RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: "Deadline Date: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic)),
                           
                            TextSpan(
                                text: "${task.completionTime!.day}"
                                    "-"
                                    "${task.completionTime!.month}"
                                    "-"
                                    "${task.completionTime!.year}"
                                    "\n",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 255, 94, 82))),
                            const TextSpan(
                                text: "Deadline Time: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic)),
                            TextSpan(
                                text: DateFormat('h:mm a')
                                    .format(task.completionTime!),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 255, 94, 82)))
                          ]),
                        )
                      : const Text(""),
                ),
              ]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newTaskTitle = '';
              String newdesc = '';
              DateTime? completionTime;
           
              bool isvalid = false;
              return AlertDialog(
                title: const  Text('Add a Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(label: Text("Title")),
                      onChanged: (value) {
                        newTaskTitle = value;
                        isvalid = true;
                      },
                    ),
                    CupertinoButton( 
                    
                      borderRadius: BorderRadius.circular(10),
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          // ignore: use_build_context_synchronously
                          final selectedTime = await  showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                            
                          
                          if (selectedDate != null && selectedTime != null) {
                            completionTime = DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                              selectedTime.hour,
                              selectedTime.minute,
                            );

                         
                          }
                        },
                        child: const  Text('Select Completion Time')),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      isvalid == true
                          ? todolist.AddTodo(
                              newTaskTitle, newdesc, completionTime)
                          :  null;
                      

                      isvalid == true ? Navigator.of(context).pop() : null;

                    
                    },
                    child:const  Text('Add Task '),
                  ),
                ],
              );
            },
          );
        },
        child:  const Icon(Icons.add),
      ),
    ));
  }
}
