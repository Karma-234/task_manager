import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final Timestamp? createdAt;
  final String? title;
  final String? description;
  final bool? done;

  Todo({
    required this.title,
    required this.description,
    this.done = false,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'done': done,
        'createdAt': createdAt
      };

  static Todo fromJson(Map<String, dynamic> data) => Todo(
        title: data['title'],
        description: data['description'],
        done: data['done'],
        createdAt: data['createdAt'],
      );
}

class TodoResponse {
  final List<Todo> todos;

  TodoResponse({required this.todos});
}
