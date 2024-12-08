import '../../../../domain/features/todo/entities/todo_entity.dart';

class TodoDto extends TodoEntity {
  TodoDto({
    super.id,
    required super.title,
    required super.description,
    required super.deadline,
    required super.importance,
  });

  factory TodoDto.fromMap(Map<String, dynamic> map) {
    return TodoDto(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String,
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline'] as int),
      importance: map['importance'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline.millisecondsSinceEpoch,
      'importance': importance,
    };
  }
}
