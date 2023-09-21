import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/core/models/payload/add_todo.dart';
import 'package:task_manager/core/models/response/todo_response.dart';

class StorageService {
  final FirebaseFirestore _storage = FirebaseFirestore.instance;

  Future<void> addTodo(
      {required AddTodoPayload payload, required String uid}) async {
    _storage.collection('Tasks').doc(uid).update(
      {
        'tasks': FieldValue.arrayUnion([
          payload.toJson(),
        ]),
      },
    );
  }

  Future<void> updateTodo(
      {required TodoResponse payload,
      required String uid,
      int index = 0}) async {
    final newTodo = Todo(
        title: payload.todos[index].title,
        description: payload.todos[index].title,
        createdAt: payload.todos[index].createdAt,
        done: true);
    payload.todos.removeAt(index);
    payload.todos.insert(index, newTodo);
    _storage.collection('Tasks').doc(uid).set(
        {'tasks': payload.todos.map((e) => e.toJson()).toList()},
        SetOptions(merge: true));
  }

  Future<void> deleteTodo({required Todo payload, required String uid}) async {
    _storage.collection('Tasks').doc(uid).update(
      {
        'tasks': FieldValue.arrayRemove([
          payload.toJson(),
        ]),
      },
    );
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getTodo({String? uid}) {
    // _storage.collection('Tasks').doc(uid).get().then((value) => value.get(field));
    return _storage
        .collection('Tasks')
        .doc(uid)
        .snapshots(includeMetadataChanges: true);
  }
}
