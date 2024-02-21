class NumberTrivia {
  final String text;
  final int number;

  NumberTrivia({required this.text, required this.number});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NumberTrivia &&
        other.text == text &&
        other.number == number;
  }

  @override
  int get hashCode => text.hashCode ^ number.hashCode;

  factory NumberTrivia.fromJSON(json) {
    return NumberTrivia(
      text: json['text'] ?? '',
      number: json['number'] ?? 0,
    );
  }
}
