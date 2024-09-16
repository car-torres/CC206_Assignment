import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List ni Car',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoListScreen(),
    );
  }
}

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final List<String> _toDoList = [];
  final TextEditingController _controller = TextEditingController();

  void _addToDoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _toDoList.add(task);
      });
      _controller.clear();
    }
  }

  void _removeToDoItem(int index) {
    setState(() {
      _toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ano ubrahon mo subong?'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Lista mo di',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addToDoItem(_controller.text),
                  child: Text('Dugang'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _toDoList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_toDoList[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeToDoItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
