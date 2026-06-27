import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student.dart';

class FirestoreService {
  final CollectionReference _studentsRef =
      FirebaseFirestore.instance.collection('students');

  Future<void> addStudent({
    required String name,
    required String roll,
    required String department,
  }) {
    return _studentsRef.add({
      'name': name,
      'roll': roll,
      'department': department,
      // Used only for sorting newest-first inside the app.
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<Student>> getStudents() {
    return _studentsRef.snapshots().map((snapshot) {
      final students =
          snapshot.docs.map((doc) => Student.fromFirestore(doc)).toList();

      // Sort newest first (docs added from the app have createdAt).
      students.sort((a, b) => b.roll.compareTo(a.roll));
      return students;
    });
  }

  /// Optional helper: delete a student by document id.
  Future<void> deleteStudent(String id) {
    return _studentsRef.doc(id).delete();
  }
}
