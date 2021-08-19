import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userTodo = '';
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['First', 'Second', 'Third']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              background: Container(
                decoration: ShapeDecoration(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              secondaryBackground: Container(
                decoration: ShapeDecoration(
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_sweep,
                    ),
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart){
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Задача удалена!')));
                  });
                }
                else{
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Задача выполнена!')));
                  });
                }
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Добавить задачу'),
                    content: TextField(
                      onChanged: (String value) {
                        userTodo = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Отмена'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrange)),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (userTodo.length != 0) {
                              setState(() {
                                todoList.add(userTodo);
                                userTodo = '';
                              });
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Задача добавлена!')));
                            }
                          },
                          child: Text('Добавить')),
                    ],
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
