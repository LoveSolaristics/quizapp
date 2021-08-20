import 'package:flutter/material.dart';

import 'package:quizapp/pages/author.dart';
import 'package:quizapp/pages/home.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Completed extends StatefulWidget {
  const Completed({Key key}) : super(key: key);

  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {

  void onSelectedButtonInCompleted(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            Home()), (Route<dynamic> route) => false);
        break;
      case 1:
        break;
      case 2:
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
        title: Text('Завершенные дела'),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => onSelectedButtonInCompleted(context, item),
            itemBuilder: (context) => [
              PopupMenuItem(value: 0, child: Text('Список дел')),
              PopupMenuItem(value: 1, child: Text('Завершенные дела')),
              PopupMenuItem(value: 2, child: Text('Автор')),
            ],
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items_completed').orderBy('item').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) return Text('Нет записей');
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                background: Container(
                  decoration: ShapeDecoration(
                    color: Colors.deepOrange,
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
                        FirebaseFirestore.instance.collection('items_completed').doc(snapshot.data.docs[index].id).delete();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Выполненная задача удалена!')));
                      },
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  FirebaseFirestore.instance.collection('items_completed').doc(snapshot.data.docs[index].id).delete();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Выполненная задача удалена!')));
                },
              );
            }
          );
        },
      ),
    );
  }
}

