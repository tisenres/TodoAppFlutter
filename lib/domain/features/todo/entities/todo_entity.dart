class TodoEntity {
  final int? id;
  final String title;
  final String description;
  final DateTime deadline;
  final int importance;

  const TodoEntity({
    this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.importance,
  });
}
