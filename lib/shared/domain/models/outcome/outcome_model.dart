class Outcome {
  final int? id;
  final int amount;
  final String title;
  final String description;

  Outcome({
    this.id,
    required this.amount,
    required this.title,
    required this.description,
  });

  factory Outcome.fromMap(Map<String, dynamic> map) => Outcome(
    id: map['id'] as int?,
    amount: map['amount'] as int,
    title: map['title'] as String,
    description: map['description'] as String,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'amount': amount,
    'title': title,
    'description': description,
  };
}
