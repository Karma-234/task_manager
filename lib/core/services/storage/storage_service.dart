import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/core/models/payload/add_todo.dart';

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

  Future<void> deleteTodo(
      {required AddTodoPayload payload, required String uid}) async {
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
