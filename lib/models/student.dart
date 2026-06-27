import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String id;
  final String name;
  final String roll;
  final String department;

  Student({
    required this.id,
    required this.name,
    required this.roll,
    required this.department,
  });

  factory Student.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Student(
      id: doc.id,
      name: (data['name'] ?? '').toString(),
      roll: (data['roll'] ?? '').toString(),
      department: (data['department'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'roll': roll,
      'department': department,
    };
  }
}
