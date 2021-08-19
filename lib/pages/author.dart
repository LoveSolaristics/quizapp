import 'package:flutter/material.dart';

class Author extends StatelessWidget {
  const Author({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Автор'),
        centerTitle: true,
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

