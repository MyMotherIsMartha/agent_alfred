import 'package:flutter/material.dart';

class _Todo {
  final String title;
  final String description;
  
  _Todo(this.title, this.description);
}

class SendDataPage extends StatelessWidget {
  final tools = List.generate(20, (i) => 
     _Todo(
       'Todo $i',
       'A description of what we needs to be done for Todo $i',
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: Text('Send Data')
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(todos[index].title),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => _DetailPage(tode: todos[index]),
          ))
        )
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  const _DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}