import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/repositories/todo_repository.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();


  List<Todo> tasks = [];

  Todo? deletedTask;
  int? deletedTaskPos;

  String? errorText;

  @override
  void initState() {
    super.initState();
    
    todoRepository.getTodoList().then((value){
      setState(() {
      tasks = value;});
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: todoController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(223, 146, 142, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: 'Add a new task',
                                hintText: 'Ex: Complete the math list.',
                                errorText: errorText,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(29, 32, 31, 1),
                                  )
                                )
                                ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String textInside = todoController.text;

                            if(textInside.isEmpty) {
                              setState(() {
                                errorText = 'Task name cannot be empty!';
                              });
                              return;
                            }

                            setState(() {
                              Todo newTodo = Todo(
                                title: textInside,
                                dateTime: DateTime.now(),
                              );
                              tasks.add(newTodo);
                              errorText = null;
                              todoController.clear();
                              todoRepository.saveTodoList(tasks);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(197, 136 , 130, 1),
                            padding: const EdgeInsets.all(15),
                            shape: const CircleBorder(),
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
                              onDelete: onDelete,
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
                            child: Text(
                          'You have ${tasks.length} unfinished tasks.',
                          style: TextStyle(color: Colors.white),
                        )),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: showDeleteTasksConfirm,
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(197, 136 , 130, 1),
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text('Clean all'),
                        )
                      ],
                    )
                  ],
                ))),
      ),
    );
  }

  //callback:

  void onDelete(Todo task) {
    deletedTask = task;
    deletedTaskPos = tasks.indexOf(task);
    setState(() {
      tasks.remove(task);
    });
     todoRepository.saveTodoList(tasks);

    // alert message when deleting something:
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Task ${task.title} has been removed!',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(197, 136 , 130, 1),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              tasks.insert(deletedTaskPos!, deletedTask!);
            });
             todoRepository.saveTodoList(tasks);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeleteTasksConfirm() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(209, 222, 222, 1),
        title: Text('Clean all?'),
        content: Text('Are you sure you want to delete all tasks?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
            style: TextButton.styleFrom(primary: Colors.black),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTasks();
            },
            child: Text('Clean all'),
            style: TextButton.styleFrom(primary: Colors.red),
          ),
        ],
      ),
    );
  }
    void deleteAllTasks(){
      setState(() {
        tasks.clear();
      });
       todoRepository.saveTodoList(tasks);
    }
}
