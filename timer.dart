// main.dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Map<String, dynamic>> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _todos.add({'title': _controller.text, 'completed': false});
      _controller.clear();
    });
  }

  void _toggleTodo(int index) {
    setState(() => _todos[index]['completed'] = !_todos[index]['completed']);
  }

  void _deleteTodo(int index) {
    setState(() => _todos.removeAt(index));
  }

  void _editTodo(int index) async {
    final TextEditingController editController = TextEditingController(
      text: _todos[index]['title']
    );
    
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Редактировать задачу'),
        content: TextField(controller: editController),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'delete'),
            child: const Text('Удалить', style: TextStyle(color: Colors.red))),
          TextButton(
            onPressed: () => Navigator.pop(context, 'save'),
            child: const Text('Сохранить')),
        ],
      ),
    );

    if (result == 'save' && editController.text.isNotEmpty) {
      setState(() => _todos[index]['title'] = editController.text);
    } else if (result == 'delete') {
      _deleteTodo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Новая задача',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTodo,
                ),
              ),
              onSubmitted: (_) => _addTodo(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(_todos[index]['title'] + index.toString()),
                background: Container(color: Colors.red),
                onDismissed: (_) => _deleteTodo(index),
                child: ListTile(
                  leading: Checkbox(
                    value: _todos[index]['completed'],
                    onChanged: (_) => _toggleTodo(index),
                  ),
                  title: Text(_todos[index]['title'],
                    style: TextStyle(
                      decoration: _todos[index]['completed']
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    ),
                  ),
                  onTap: () => _editTodo(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}