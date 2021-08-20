import 'package:flutter/material.dart';
import 'package:quizapp/pages/home.dart';

class Author extends StatelessWidget {
  const Author({Key key}) : super(key: key);

  void onSelectedButtonInAuthor(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            Home()), (Route<dynamic> route) => false);
        break;
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Автор'),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => onSelectedButtonInAuthor(context, item),
            itemBuilder: (context) => [
              PopupMenuItem(value: 0, child: Text('Список дел')),
              PopupMenuItem(value: 1, child: Text('Автор')),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 70, left: 95),
        child: Column(
          children: [
            Container(
              child: CircleAvatar(backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/32870032?v=4')),
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            Text('Анфимов Дмитрий', style: TextStyle(fontSize: 25, height: 4),),
            ElevatedButton(onPressed: (){}, child: Text('Github проекта'))
          ],
        ) ,
      )
    );
  }
}

