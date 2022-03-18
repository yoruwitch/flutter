import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  

  List<Todo> tasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(249, 245, 225, 219),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                              controller: todoController,
                              
                              decoration: 
                              InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  labelText: 'Add a new task',
                                  hintText: 'Ex: Complete the math list.'),
                                  ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String textInside = todoController.text;
                            setState(() {
                              Todo newTodo = Todo(
                                title: textInside,
                                dateTime: DateTime.now(),
                              );
                              tasks.add(newTodo);
                              todoController.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(210, 69, 235, 1),
                            padding: EdgeInsets.all(15),
                            shape: CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Flexible(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          for (Todo task in tasks)
                            TodoListItem(
                              task: task,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text('You have ${tasks.length} unfinished tasks.')),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(210, 69, 235, 1),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Text('Clean all'),
                        )
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
