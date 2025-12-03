class OutcomeModel {
  final int? id;
  final DateTime dateTime;
  final int amount;
  final String title;
  final String description;

  OutcomeModel({
    this.id,
    required this.dateTime,
    required this.amount,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'date': dateTime.toIso8601String(),
    'amount': amount,
    'title': title,
    'description': description,
  };

  factory OutcomeModel.fromJson(Map<String, dynamic> map) => OutcomeModel(
    id: map['id'],
    dateTime: DateTime.parse(map['date']),
    amount: map['amount'],
    title: map['title'],
    description: map['description'],
  );
}
