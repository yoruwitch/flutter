import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Add a new task',
                                hintText: 'Ex: Complete the math list.')),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(210, 69, 235, 1),
                          padding: EdgeInsets.all(15),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 16,),

                  ListView(
                    shrinkWrap: true,
                    children: const [
                      ListTile(
                        title: Text('Task #1'),
                      )
                    ],
                  ),

                  const SizedBox(height: 16,),


                  Row(
                    children: [
                      const Expanded(
                        child: Text('You have 0 unfinished tasks.')
                        ),

                      const SizedBox(width:16),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(210, 69, 235, 1),
                          padding: EdgeInsets.all(15),
                        
                      ),
                      child: Text('Clean all'),
                       ) ],
                  )
                ],
              ))),
    );
  }
}
