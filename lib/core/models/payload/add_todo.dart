class AddTodoPayload {
  final DateTime createdAt = DateTime.now();
  final String title;
  final String description;
  final bool done;

  AddTodoPayload({
    required this.title,
    required this.description,
    this.done = false,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'done': done,
        'createdAt': createdAt
      };

  AddTodoPayload fromJson(Map<String, dynamic> data) => AddTodoPayload(
      title: data['title'],
      description: data['description'],
      done: data['done']);
}
