import 'package:flutter/material.dart';
import 'package:quizapp/pages/author.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userTodo;

  // подключение бд


  // запуск
  @override
  void initState() {
    super.initState();
  }

  void onSelectedButtonInHome(BuildContext context, int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            Author()), (Route<dynamic> route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => onSelectedButtonInHome(context, item),
            itemBuilder: (context) => [
              PopupMenuItem(value: 0, child: Text('Список дел')),
              PopupMenuItem(value: 1, child: Text('Автор')),
            ],
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').orderBy('item').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) return Text('Нет записей');
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
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
                  key: Key(snapshot.data.docs[index].id),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data.docs[index].get('item')),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_sweep,
                        ),
                        color: Colors.deepOrangeAccent,
                        onPressed: () {
                          FirebaseFirestore.instance.collection('items').doc(snapshot.data.docs[index].id).delete();
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Задача удалена!')));
                          });
                        },
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Задача удалена!')));
                      });
                    } else {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Задача выполнена!')));
                      });
                    }
                    FirebaseFirestore.instance.collection('items').doc(snapshot.data.docs[index].id).delete();
                  },
                );
              });
        },
      ),
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
                              FirebaseFirestore.instance.collection('items').add({'item': userTodo});
                              userTodo = '';

                              
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Задача добавлена!')));
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
