import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/core/models/payload/add_todo.dart';
import 'package:task_manager/core/models/response/todo_response.dart';

class StorageService {
  final FirebaseFirestore _storage = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get collection =>
      _storage.collection('Tasks');

  Future<void> addTodo(
      {required AddTodoPayload payload,
      required String uid,
      required Function(String) onError}) async {
    try {
      collection.doc(uid).update(
        {
          'tasks': FieldValue.arrayUnion([
            payload.toJson(),
          ]),
        },
      ).onError((error, stackTrace) {
        if (error.toString().contains('not found')) {
          collection.doc(uid).set({
            'tasks': [payload.toJson()]
          }, SetOptions(merge: true));
        } else {
          onError(error.toString());
        }
      });
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> updateTodo(
      {required TodoResponse payload,
      required String uid,
      int index = 0,
      required Function(String) onError}) async {
    final newTodo = Todo(
        title: payload.todos[index].title,
        description: payload.todos[index].title,
        createdAt: payload.todos[index].createdAt,
        done: true);
    try {
      payload.todos.removeAt(index);
      payload.todos.insert(index, newTodo);
      collection.doc(uid).set(
          {'tasks': payload.todos.map((e) => e.toJson()).toList()},
          SetOptions(merge: true));
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> deleteTodo(
      {required Todo payload,
      required String uid,
      required Function(String) onError}) async {
    try {
      collection.doc(uid).update(
        {
          'tasks': FieldValue.arrayRemove([
            payload.toJson(),
          ]),
        },
      );
    } catch (e) {
      onError(e.toString());
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getTodo({String? uid}) {
    return collection.doc(uid).snapshots(includeMetadataChanges: true);
  }
}
