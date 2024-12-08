import 'package:flutter/material.dart';
import '../../../../domain/features/todo/entities/todo_entity.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _deadline;
  int _importance = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
            SizedBox(height: 8),
            TextField(controller: _descriptionController, decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 8),
            ListTile(
              title: Text(_deadline == null ? 'No Deadline Chosen' : 'Deadline: $_deadline'),
              trailing: ElevatedButton(
                onPressed: _pickDeadline,
                child: Text('Pick Deadline'),
              ),
            ),
            SizedBox(height: 8),
            DropdownButton<int>(
              value: _importance,
              items: [
                DropdownMenuItem(child: Text('Low'), value: 1),
                DropdownMenuItem(child: Text('Medium'), value: 2),
                DropdownMenuItem(child: Text('High'), value: 3),
              ],
              onChanged: (val) => setState(() => _importance = val!),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createTodo,
              child: Text('Create'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _pickDeadline() async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100)
    );
    if (date == null) return;
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time == null) return;
    setState(() {
      _deadline = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  void _createTodo() {
    if (_titleController.text.trim().isEmpty) return;
    final newTodo = TodoEntity(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      deadline: _deadline ?? DateTime.now(),
      importance: _importance,
    );
    Navigator.pop(context, newTodo);
  }
}